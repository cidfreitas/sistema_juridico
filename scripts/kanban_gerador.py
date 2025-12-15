#!/usr/bin/env python3
"""
Gera HTML Kanban com dados já embutidos
"""

import json

# Ler JSON criado
with open("../data/saida/processos.json", 'r', encoding='utf-8') as f:
    dados = json.load(f)

processos = dados['processos']

# Agrupar por status
por_status = {
    'urgente': [],
    'andamento': [],
    'espera': [],
    'novo': []
}

for p in processos:
    status = p.get('status', 'novo')
    if status in por_status:
        por_status[status].append(p)

# Gerar HTML
html = f'''<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kanban - Seu Sistema Jurídico</title>
    <style>
        * {{ margin: 0; padding: 0; box-sizing: border-box; }}
        body {{
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }}
        .container {{ max-width: 1600px; margin: 0 auto; }}
        .header {{
            text-align: center;
            color: white;
            margin-bottom: 30px;
            text-shadow: 0 2px 10px rgba(0,0,0,0.3);
        }}
        .header h1 {{ font-size: 2.5em; margin-bottom: 10px; }}
        .header p {{ font-size: 1.1em; opacity: 0.9; }}
        .kanban-board {{
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }}
        .kanban-column {{
            background: white;
            border-radius: 8px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            overflow: hidden;
        }}
        .column-header {{
            padding: 15px;
            font-weight: 600;
            font-size: 1.1em;
            border-bottom: 3px solid;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }}
        .column-header.urgente {{ background: #fff5f5; border-bottom-color: #e74c3c; color: #c0392b; }}
        .column-header.andamento {{ background: #fff9f0; border-bottom-color: #f39c12; color: #d68910; }}
        .column-header.espera {{ background: #f5f5f5; border-bottom-color: #95a5a6; color: #7f8c8d; }}
        .column-header.novo {{ background: #f0f9ff; border-bottom-color: #3498db; color: #2980b9; }}
        .badge {{
            background: rgba(0,0,0,0.1);
            padding: 4px 10px;
            border-radius: 12px;
            font-size: 0.85em;
            font-weight: 700;
        }}
        .cards-container {{
            padding: 15px;
            min-height: 400px;
            display: flex;
            flex-direction: column;
            gap: 10px;
            overflow-y: auto;
        }}
        .process-card {{
            background: #f8f9fa;
            border: 2px solid #e0e0e0;
            border-radius: 6px;
            padding: 12px;
            cursor: pointer;
            transition: all 0.2s;
            border-left: 4px solid #3498db;
        }}
        .process-card:hover {{ 
            box-shadow: 0 5px 15px rgba(0,0,0,0.1); 
            transform: translateY(-2px);
        }}
        .process-card.urgente {{ border-left-color: #e74c3c; background: #fadbd8; }}
        .process-card.andamento {{ border-left-color: #f39c12; background: #fdebd0; }}
        .process-card.espera {{ border-left-color: #95a5a6; background: #f4f6f7; }}
        .process-card.novo {{ border-left-color: #3498db; background: #ebf5fb; }}
        .card-cnj {{
            font-weight: 600;
            font-size: 0.9em;
            color: #2c3e50;
            margin-bottom: 6px;
            font-family: 'Courier New', monospace;
            word-break: break-all;
        }}
        .card-parte {{
            font-size: 0.8em;
            color: #555;
            margin-bottom: 4px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }}
        .card-meta {{
            font-size: 0.75em;
            color: #888;
            margin-top: 8px;
            padding-top: 8px;
            border-top: 1px solid rgba(0,0,0,0.1);
            display: flex;
            justify-content: space-between;
        }}
        .stats {{
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
        }}
        .stat-card {{
            background: white;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }}
        .stat-number {{
            font-size: 2.5em;
            font-weight: 700;
            color: #667eea;
            margin-bottom: 5px;
        }}
        .stat-label {{ font-size: 0.95em; color: #666; }}
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>⚖️ Kanban Jurídico</h1>
            <p>{len(processos)} Processos | {dados['metadata']['total_andamentos']} Andamentos</p>
        </div>

        <div class="kanban-board">
'''

# Adicionar colunas
status_icons = {
    'urgente': '🔴 URGENTE',
    'andamento': '🟡 EM ANDAMENTO',
    'espera': '⏸️ EM ESPERA',
    'novo': '🟦 NOVOS'
}

for status in ['urgente', 'andamento', 'espera', 'novo']:
    procs = por_status[status]
    html += f'''
            <div class="kanban-column">
                <div class="column-header {status}">
                    <span>{status_icons[status]}</span>
                    <span class="badge">{len(procs)}</span>
                </div>
                <div class="cards-container">
'''
    
    for p in procs:
        html += f'''
                    <div class="process-card {status}" title="{p['parte']}">
                        <div class="card-cnj">{p['cnj']}</div>
                        <div class="card-parte">{p['parte'][:40]}...</div>
                        <div class="card-meta">
                            <span>📊 {p['total_andamentos']}</span>
                            <span>{p['pasta']}</span>
                        </div>
                    </div>
'''
    
    html += '''
                </div>
            </div>
'''

html += '''
        </div>

        <div class="stats">
'''

for status, icon, label in [
    ('urgente', '🔴', 'Urgentes'),
    ('andamento', '🟡', 'Em Andamento'),
    ('espera', '⏸️', 'Em Espera'),
    ('novo', '🟦', 'Novos')
]:
    html += f'''
            <div class="stat-card">
                <div class="stat-number">{len(por_status[status])}</div>
                <div class="stat-label">{icon} {label}</div>
            </div>
'''

html += '''
        </div>
    </div>
</body>
</html>
'''

# Salvar HTML
with open("../data/saida/kanban.html", 'w', encoding='utf-8') as f:
    f.write(html)

print("✅ Kanban gerado com sucesso!")
print(f"📍 Arquivo: ../data/saida/kanban.html")
print(f"\n📊 Resumo:")
print(f"  🔴 Urgentes: {len(por_status['urgente'])}")
print(f"  🟡 Andamento: {len(por_status['andamento'])}")
print(f"  ⏸️  Espera: {len(por_status['espera'])}")
print(f"  🟦 Novos: {len(por_status['novo'])}")

