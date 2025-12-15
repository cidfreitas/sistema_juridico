#!/usr/bin/env python3
"""
API Flask - Sistema Jurídico Agêntico
REST API completa com autenticação, auditoria e tempo real
PORTA: 8000 (para não conflitar com Promptify na 5000)
"""

from flask import Flask, request, jsonify
from flask_cors import CORS
import sqlite3
import os
from datetime import datetime, timedelta
from functools import wraps

app = Flask(__name__)
CORS(app)

DB_PATH = os.path.expanduser("~/Library/CloudStorage/GoogleDrive-cidfreitas@hotmail.com/Meu Drive/Advocacia/_IA/sistema_juridico/database/sistema_juridico.db")
API_KEY = "sistema_juridico_cid_2025"

def require_api_key(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        api_key = request.headers.get('X-API-Key')
        if not api_key or api_key != API_KEY:
            return jsonify({'erro': 'API Key inválida'}), 401
        return f(*args, **kwargs)
    return decorated_function

def get_db():
    db = sqlite3.connect(DB_PATH)
    db.row_factory = sqlite3.Row
    return db

# ENDPOINTS - PROCESSOS

@app.route('/api/v1/processos', methods=['GET'])
@require_api_key
def listar_processos():
    """Listar todos os processos"""
    try:
        db = get_db()
        cursor = db.cursor()
        
        status = request.args.get('status')
        tribunal = request.args.get('tribunal')
        
        query = "SELECT * FROM processos WHERE 1=1"
        params = []
        
        if status:
            query += " AND status = ?"
            params.append(status)
        if tribunal:
            query += " AND tribunal = ?"
            params.append(tribunal)
        
        cursor.execute(query, params)
        processos = cursor.fetchall()
        
        resultado = []
        for p in processos:
            resultado.append({
                'id': p['id'],
                'cnj': p['cnj'],
                'tipo': p['tipo_processo'],
                'status': p['status'],
                'tribunal': p['tribunal'],
                'parte': p['parte_principal'],
                'pasta': p['pasta_sistema'],
                'ultimo_andamento': p['ultimo_andamento_data'],
                'dias_prazo': p['dias_para_prazo']
            })
        
        db.close()
        return jsonify({'total': len(resultado), 'processos': resultado}), 200
    
    except Exception as e:
        return jsonify({'erro': str(e)}), 500

@app.route('/api/v1/processos/<cnj>', methods=['GET'])
@require_api_key
def obter_processo(cnj):
    """Obter detalhes de um processo"""
    try:
        db = get_db()
        cursor = db.cursor()
        
        cursor.execute("SELECT * FROM processos WHERE cnj = ?", (cnj,))
        processo = cursor.fetchone()
        
        if not processo:
            return jsonify({'erro': 'Processo não encontrado'}), 404
        
        cursor.execute("""
            SELECT * FROM andamentos 
            WHERE processo_id = ? 
            ORDER BY data_andamento DESC LIMIT 10
        """, (processo['id'],))
        andamentos = [dict(a) for a in cursor.fetchall()]
        
        cursor.execute("""
            SELECT * FROM prazos 
            WHERE processo_id = ? 
            ORDER BY data_vencimento ASC
        """, (processo['id'],))
        prazos = [dict(p) for p in cursor.fetchall()]
        
        resultado = {
            'id': processo['id'],
            'cnj': processo['cnj'],
            'tipo': processo['tipo_processo'],
            'status': processo['status'],
            'tribunal': processo['tribunal'],
            'parte': processo['parte_principal'],
            'adversa': processo['parte_adversa'],
            'pasta': processo['pasta_sistema'],
            'andamentos': andamentos,
            'prazos': prazos
        }
        
        db.close()
        return jsonify(resultado), 200
    
    except Exception as e:
        return jsonify({'erro': str(e)}), 500

@app.route('/api/v1/processos/<cnj>/status', methods=['PATCH'])
@require_api_key
def atualizar_status(cnj):
    """Atualizar status de um processo"""
    try:
        data = request.get_json()
        novo_status = data.get('status')
        
        if novo_status not in ['urgente', 'andamento', 'espera', 'novo', 'arquivado']:
            return jsonify({'erro': 'Status inválido'}), 400
        
        db = get_db()
        cursor = db.cursor()
        
        cursor.execute("SELECT id FROM processos WHERE cnj = ?", (cnj,))
        processo = cursor.fetchone()
        
        if not processo:
            return jsonify({'erro': 'Processo não encontrado'}), 404
        
        processo_id = processo['id']
        
        cursor.execute("""
            UPDATE processos 
            SET status = ?, data_modificacao = CURRENT_TIMESTAMP
            WHERE cnj = ?
        """, (novo_status, cnj))
        
        cursor.execute("""
            INSERT INTO auditoria (
                processo_id, tipo_evento, tabela_afetada, usuario, 
                valor_anterior, valor_novo, detalhes
            ) VALUES (?, ?, ?, ?, ?, ?, ?)
        """, (
            processo_id,
            'status_mudou',
            'processos',
            'api',
            'status_anterior',
            novo_status,
            f'Status alterado via API para {novo_status}'
        ))
        
        db.commit()
        db.close()
        
        return jsonify({'mensagem': f'Status atualizado para {novo_status}'}), 200
    
    except Exception as e:
        return jsonify({'erro': str(e)}), 500

# ENDPOINTS - PRAZOS

@app.route('/api/v1/prazos/criticos', methods=['GET'])
@require_api_key
def prazos_criticos():
    """Listar prazos vencendo"""
    try:
        dias = request.args.get('dias', 3, type=int)
        
        db = get_db()
        cursor = db.cursor()
        
        data_limite = (datetime.now() + timedelta(days=dias)).date()
        
        cursor.execute("""
            SELECT p.*, proc.cnj, proc.parte_principal
            FROM prazos p
            JOIN processos proc ON p.processo_id = proc.id
            WHERE p.data_vencimento <= ? AND p.status = 'aberto'
            ORDER BY p.data_vencimento ASC
        """, (data_limite,))
        
        prazos = [dict(p) for p in cursor.fetchall()]
        
        db.close()
        return jsonify({'total': len(prazos), 'prazos': prazos}), 200
    
    except Exception as e:
        return jsonify({'erro': str(e)}), 500

# ENDPOINTS - DASHBOARD

@app.route('/api/v1/dashboard', methods=['GET'])
@require_api_key
def dashboard():
    """Dashboard executivo"""
    try:
        db = get_db()
        cursor = db.cursor()
        
        cursor.execute("SELECT status, COUNT(*) as total FROM processos GROUP BY status")
        status_count = {row['status']: row['total'] for row in cursor.fetchall()}
        
        cursor.execute("""
            SELECT COUNT(*) as total FROM prazos 
            WHERE data_vencimento <= DATE('now') AND status = 'aberto'
        """)
        prazos_vencidos = cursor.fetchone()['total']
        
        cursor.execute("""
            SELECT COUNT(*) as total FROM prazos 
            WHERE data_vencimento BETWEEN DATE('now') AND DATE('now', '+7 days') 
            AND status = 'aberto'
        """)
        prazos_proximos = cursor.fetchone()['total']
        
        cursor.execute("""
            SELECT a.*, proc.cnj 
            FROM andamentos a
            JOIN processos proc ON a.processo_id = proc.id
            ORDER BY a.data_andamento DESC LIMIT 5
        """)
        andamentos_recentes = [dict(row) for row in cursor.fetchall()]
        
        resultado = {
            'status_processos': status_count,
            'prazos_vencidos': prazos_vencidos,
            'prazos_proximos': prazos_proximos,
            'andamentos_recentes': andamentos_recentes,
            'data_atualizacao': datetime.now().isoformat()
        }
        
        db.close()
        return jsonify(resultado), 200
    
    except Exception as e:
        return jsonify({'erro': str(e)}), 500

# HEALTH CHECK

@app.route('/api/v1/health', methods=['GET'])
def health():
    """Verificar API"""
    try:
        db = get_db()
        cursor = db.cursor()
        cursor.execute("SELECT COUNT(*) FROM processos")
        total = cursor.fetchone()[0]
        db.close()
        
        return jsonify({
            'status': 'online',
            'banco': 'conectado',
            'processos': total,
            'timestamp': datetime.now().isoformat()
        }), 200
    except:
        return jsonify({'status': 'erro'}), 500

@app.errorhandler(404)
def not_found(e):
    return jsonify({'erro': 'Endpoint não encontrado'}), 404

if __name__ == '__main__':
    print("=" * 80)
    print("⚖️  SISTEMA JURÍDICO AGÊNTICO - API")
    print("=" * 80)
    print(f"\n📁 Banco de dados:")
    print(f"   {DB_PATH}")
    print(f"\n🔑 API Key: {API_KEY}")
    print(f"\n🌐 Servidor rodando em: http://localhost:8000")
    print(f"\n✅ Testar saúde:")
    print(f'   curl -H "X-API-Key: {API_KEY}" http://localhost:8000/api/v1/health')
    print(f"\n✅ Listar processos:")
    print(f'   curl -H "X-API-Key: {API_KEY}" http://localhost:8000/api/v1/processos')
    print(f"\n✅ Dashboard:")
    print(f'   curl -H "X-API-Key: {API_KEY}" http://localhost:8000/api/v1/dashboard')
    print("\n" + "=" * 80)
    
    app.run(debug=True, host='0.0.0.0', port=8000)


@app.route('/api/v1/andamentos', methods=['POST'])
@require_api_key
def adicionar_andamento():
    """Adiciona novo andamento (usado pelo scraping)"""
    try:
        data = request.get_json()
        
        db = get_db()
        cursor = db.cursor()
        
        # Procura processo pelo CNJ
        cursor.execute("SELECT id FROM processos WHERE cnj = ?", (data['cnj'],))
        processo = cursor.fetchone()
        
        if not processo:
            return jsonify({'erro': 'Processo não encontrado'}), 404
        
        # Insere andamento
        cursor.execute("""
            INSERT OR IGNORE INTO andamentos
            (processo_id, data_andamento, tipo_andamento, descricao, data_scraping, fonte)
            VALUES (?, ?, ?, ?, ?, 'tjsp')
        """, (processo['id'], data['data_andamento'], data['tipo'], data['descricao'], datetime.now().isoformat()))
        
        db.commit()
        db.close()
        
        return jsonify({'status': 'ok', 'mensagem': 'Andamento inserido'}), 201
    
    except Exception as e:
        return jsonify({'erro': str(e)}), 500
