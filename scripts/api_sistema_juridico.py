import sqlite3
import os
from flask import Flask, jsonify, request
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# CONFIGURAÇÃO
DB_PATH = "/Users/cidfreitas/Library/CloudStorage/GoogleDrive-cidfreitas@hotmail.com/Meu Drive/Advocacia/_IA/sistema_juridico/database/sistema_juridico.db"
API_KEY = "sistema_juridico_cid_2025"

def get_db_connection():
    if not os.path.exists(DB_PATH):
        raise Exception(f"Banco não encontrado em: {DB_PATH}")
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn

@app.route('/api/v1/health', methods=['GET'])
def health_check():
    return jsonify({"status": "online", "banco": DB_PATH, "motor": "v2.0-fix"}), 200

@app.route('/api/v1/dashboard', methods=['GET'])
def get_dashboard():
    key = request.headers.get('X-API-Key')
    if key != API_KEY:
        return jsonify({"erro": "Acesso negado"}), 403

    try:
        conn = get_db_connection()
        
        # 1. Totais
        total_proc = conn.execute("SELECT COUNT(*) FROM processos").fetchone()[0]
        
        # 2. Prazos Críticos (Vencidos ou vencendo hoje)
        prazos_criticos = conn.execute("SELECT COUNT(*) FROM prazos WHERE status = 'ABERTO' AND data_vencimento <= date('now')").fetchone()[0]
        
        # 3. Prazos Próximos (7 dias)
        prazos_proximos = conn.execute("SELECT COUNT(*) FROM prazos WHERE status = 'ABERTO' AND data_vencimento > date('now') AND data_vencimento <= date('now', '+7 days')").fetchone()[0]

        # 4. Novos Movimentos (Últimos 15 do TJSP)
        # BUSCA CORRETA NA TABELA ANDAMENTOS
        movimentos_db = conn.execute("""
            SELECT 
                p.cnj,
                a.data_andamento,
                a.descricao
            FROM andamentos a
            JOIN processos p ON a.processo_id = p.id
            WHERE a.fonte = 'tjsp'
            ORDER BY a.data_andamento DESC
            LIMIT 15
        """).fetchall()

        lista_movimentos = []
        for mov in movimentos_db:
            lista_movimentos.append({
                "cnj": mov['cnj'],
                "data": mov['data_andamento'],
                "descricao": mov['descricao'][:120] + "..." if len(mov['descricao']) > 120 else mov['descricao']
            })

        conn.close()

        return jsonify({
            "metricas": {
                "total_processos": total_proc,
                "prazos_criticos": prazos_criticos,
                "prazos_proximos": prazos_proximos,
                "novos_movimentos": len(lista_movimentos)
            },
            "movimentos_recentes": lista_movimentos
        })

    except Exception as e:
        return jsonify({"erro": str(e)}), 500

if __name__ == '__main__':
    print(f"🚀 MOTOR CORRIGIDO (v2.0) INICIADO")
    print(f"📂 Lendo banco em: {DB_PATH}")
    app.run(port=8000, debug=True)
