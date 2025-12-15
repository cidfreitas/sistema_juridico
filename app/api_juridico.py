import sqlite3
import os
import sys
from flask import Flask, jsonify
from flask_cors import CORS
from datetime import datetime, timedelta

app = Flask(__name__)
CORS(app)

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DB_PATH = os.path.join(BASE_DIR, '..', 'database', 'sistema_juridico.db')

def get_db():
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn

def parse_data(data_str):
    if not data_str: return datetime.min
    for fmt in ('%Y-%m-%d', '%d-%m-%Y', '%d/%m/%Y'):
        try: return datetime.strptime(data_str, fmt)
        except: continue
    return datetime.min

@app.route('/api/v1/dashboard', methods=['GET'])
def dashboard():
    try:
        conn = get_db()
        cursor = conn.cursor()
        hoje = datetime.now()
        hoje_str = hoje.strftime('%Y-%m-%d')
        
        # 1. Total Processos
        try: total = cursor.execute("SELECT COUNT(*) FROM processos").fetchone()[0]
        except: total = 0
        
        # 2. Prazos Vencidos (Menor que hoje)
        try: criticos = cursor.execute("SELECT COUNT(*) FROM prazos WHERE status != 'CONCLUIDO' AND data_vencimento < ?", (hoje_str,)).fetchone()[0]
        except: criticos = 0
        
        # 3. Prazos Próximos (Entre Hoje e Hoje+7 dias)
        daqui_7 = (hoje + timedelta(days=7)).strftime('%Y-%m-%d')
        try: proximos = cursor.execute("SELECT COUNT(*) FROM prazos WHERE status != 'CONCLUIDO' AND data_vencimento BETWEEN ? AND ?", (hoje_str, daqui_7)).fetchone()[0]
        except: proximos = 0

        # 4. Movimentos
        query = "SELECT a.data_andamento, p.cnj, p.parte_principal, a.descricao FROM andamentos a JOIN processos p ON a.processo_id = p.id"
        rows = cursor.execute(query).fetchall()
        
        lista = []
        novos_hoje = 0
        str_hoje_br = hoje.strftime('%d-%m-%Y')
        str_hoje_iso = hoje.strftime('%Y-%m-%d')

        for r in rows:
            dt = parse_data(r['data_andamento'])
            pt = r['parte_principal'] if r['parte_principal'] else "Não informado"
            
            # Conta se é de hoje
            d_str = r['data_andamento']
            if d_str == str_hoje_br or d_str == str_hoje_iso:
                novos_hoje += 1

            lista.append({ "dt_obj": dt, "data": r['data_andamento'], "cnj": r['cnj'], "partes": pt, "descricao": r['descricao'] })
            
        lista.sort(key=lambda x: x['dt_obj'], reverse=True)
        final = [ {k:v for k,v in i.items() if k!='dt_obj'} for i in lista[:100] ]
        
        conn.close()
        
        return jsonify({ 
            "metricas": { 
                "total_processos": total, 
                "prazos_criticos": criticos,
                "prazos_proximos": proximos,
                "novos_movimentos": novos_hoje 
            }, 
            "movimentos_recentes": final 
        })
    except Exception as e:
        return jsonify({"erro": str(e)}), 500

if __name__ == '__main__':
    print("MOTOR 4-QUADROS LIGADO!")
    app.run(host='0.0.0.0', port=8000)
