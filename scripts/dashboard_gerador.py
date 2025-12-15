#!/usr/bin/env python3
"""
Gera Dashboard individual para cada processo - VERSAO CORRIGIDA
"""

import json
from pathlib import Path

# Ler JSON
with open("../data/saida/processos.json", 'r', encoding='utf-8') as f:
    dados = json.load(f)

processos = dados['processos']

# Criar pasta para dashboards
Path("../data/saida/dashboards").mkdir(exist_ok=True)

# Timeline stages
def gerar_timeline(processo):
    """Gera timeline baseado no status e andamentos"""
    stages = [
        {'nome': 'Ajuizamento', 'icon': '📝', 'completo': True},
        {'nome': 'Citação', 'icon': '📮', 'completo': True},
        {'nome': 'Resposta', 'icon': '💬', 'completo': processo['status'] in ['andamento', 'espera']},
        {'nome': 'Prova', 'icon': '🔍', 'completo': processo['status'] in ['espera']},
        {'nome': 'Sentença', 'icon': '⚖️', 'completo': False},
    ]
    return stages

# Gerar sugestão próximo passo
def gerar_proxima_acao(processo):
    """Sugere próxima ação baseado no status"""
    sugestoes = {
        'urgente': '🔴 AÇÃO IMEDIATA: Prazo vencendo em dias. Revisar e preparar resposta urgentemente.',
        'andamento': '🟡 Em progresso: Aguardar manifestação da outra parte ou prepara próxima petição.',
        'espera': '⏸️ Aguardando: Sistema aguarda andamento. Verifique prazos regularmente.',
        'novo': '🟦 Novo: Caso registrado. Revisar completude dos autos e priorização.',
    }
    return sugestoes.get(processo['status'], 'Aguardando próximo andamento')

# Gerar HTML para cada processo
for processo in processos:
    cnj = processo['cnj']
    timeline = gerar_timeline(processo)
    proxima_acao = gerar_proxima_acao(processo)
    
    # Cores por status
    cores = {
        'urgente': {'bg': '#fadbd8', 'border': '#e74c3c', 'text': '#c0392b'},
        'andamento': {'bg': '#fdebd0', 'border': '#f39c12', 'text': '#d68910'},
        'espera': {'bg': '#f4f6f7', 'border': '#95a5a6', 'text': '#7f8c8d'},
        'novo': {'bg': '#ebf5fb', 'border': '#3498db', 'text': '#2980b9'},
    }
    cor = cores.get(processo['status'], cores['novo'])
    
    html = f'''<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - {cnj}</title>
    <style>
        * {{ margin: 0; padding: 0; box-sizing: border-box; }}
        
        body {{
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }}
        
        .container {{ max-width: 900px; margin: 0 auto; }}
        
        .header {{
            background: white;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }}
        
        .header-top {{
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }}
        
        .btn-voltar {{
            background: #667eea;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 600;
            text-decoration: none;
            display: inline-block;
        }}
        
        .btn-voltar:hover {{ background: #764ba2; }}
        
        .status-badge {{
            background: {cor['bg']};
            color: {cor['text']};
            border: 2px solid {cor['border']};
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: 600;
        }}
        
        .cnj-numero {{
            font-size: 1.3em;
            font-weight: 700;
            color: #2c3e50;
            font-family: 'Courier New', monospace;
        }}
        
        .secao {{
            background: white;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }}
        
        .secao h2 {{
            font-size: 1.3em;
            margin-bottom: 15px;
            color: #2c3e50;
            border-bottom: 2px solid #667eea;
            padding-bottom: 10px;
        }}
        
        .timeline {{
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 20px 0;
            position: relative;
        }}
        
        .timeline::before {{
            content: '';
            position: absolute;
            top: 50%;
            left: 0;
            right: 0;
            height: 2px;
            background: #ddd;
            z-index: 0;
        }}
        
        .stage {{
            flex: 1;
            text-align: center;
            position: relative;
            z-index: 1;
        }}
        
        .stage-icon {{
            font-size: 2em;
            margin-bottom: 5px;
        }}
        
        .stage.completo .stage-icon {{
            filter: drop-shadow(0 0 5px #27ae60);
        }}
        
        .stage-nome {{
            font-size: 0.85em;
            color: #555;
        }}
        
        .stage-circle {{
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: white;
            border: 3px solid #ddd;
            margin: 0 auto 8px;
        }}
        
        .stage.completo .stage-circle {{
            background: #27ae60;
            border-color: #27ae60;
        }}
        
        .proxima-acao {{
            background: {cor['bg']};
            border-left: 4px solid {cor['border']};
            padding: 15px;
            border-radius: 6px;
            margin: 15px 0;
            color: {cor['text']};
            font-weight: 600;
        }}
        
        .andamentos-lista {{
            list-style: none;
        }}
        
        .andamento-item {{
            padding: 12px;
            border-bottom: 1px solid #eee;
            display: flex;
            gap: 12px;
        }}
        
        .andamento-item:last-child {{ border-bottom: none; }}
        
        .andamento-data {{
            min-width: 100px;
            font-weight: 600;
            color: #667eea;
            font-family: 'Courier New', monospace;
        }}
        
        .andamento-desc {{
            color: #555;
            font-size: 0.9em;
        }}
        
        .info-grid {{
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
        }}
        
        .info-item {{
            padding: 12px;
            background: #f8f9fa;
            border-radius: 6px;
            border-left: 3px solid #667eea;
        }}
        
        .info-label {{
            font-size: 0.8em;
            color: #888;
            text-transform: uppercase;
            font-weight: 600;
        }}
        
        .info-valor {{
            margin-top: 5px;
            color: #2c3e50;
            word-break: break-all;
        }}
        
        .footer {{
            text-align: center;
            color: white;
            margin-top: 30px;
            opacity: 0.8;
        }}
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="header-top">
                <div>
                    <div class="cnj-numero">{cnj}</div>
                    <div style="font-size: 0.9em; color: #888; margin-top: 5px;">{processo['pasta']}</div>
                </div>
                <span class="status-badge">{processo['status'].upper()}</span>
            </div>
            <a href="../kanban_interativo.html" class="btn-voltar">← Voltar para Kanban</a>
        </div>

        <!-- TIMELINE -->
        <div class="secao">
            <h2>📊 Timeline do Processo</h2>
            <div class="timeline">
'''
    
    for stage in timeline:
        completo = 'completo' if stage['completo'] else ''
        html += f'''
                <div class="stage {completo}">
                    <div class="stage-circle"></div>
                    <div class="stage-icon">{stage['icon']}</div>
                    <div class="stage-nome">{stage['nome']}</div>
                </div>
'''
    
    html += '''
            </div>
        </div>

        <!-- AÇÃO PRÓXIMA -->
        <div class="secao">
            <h2>⚡ Próxima Ação</h2>
            <div class="proxima-acao">''' + proxima_acao + '''</div>
        </div>

        <!-- ANDAMENTOS RECENTES -->
        <div class="secao">
            <h2>📝 Últimos Andamentos</h2>
            <ul class="andamentos-lista">
'''
    
    # Adicionar últimos andamentos
    if processo['andamentos']:
        for andamento in processo['andamentos'][-5:]:
            data = andamento.get('data', 'N/A')
            desc = andamento.get('descricao', 'N/A')
            html += f'''
                <li class="andamento-item">
                    <div class="andamento-data">{data}</div>
                    <div class="andamento-desc">{desc}</div>
                </li>
'''
    else:
        html += '<li class="andamento-item"><div class="andamento-desc">Sem andamentos registrados</div></li>'
    
    html += '''
            </ul>
        </div>

        <!-- INFO TÉCNICA -->
        <div class="secao">
            <h2>📋 Informações Técnicas</h2>
            <div class="info-grid">
                <div class="info-item">
                    <div class="info-label">Tribunal</div>
                    <div class="info-valor">''' + (processo.get('origem', 'N/A')) + '''</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Partes</div>
                    <div class="info-valor">''' + (processo.get('parte', 'N/A')) + '''</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Total Andamentos</div>
                    <div class="info-valor">''' + str(processo.get('total_andamentos', 0)) + '''</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Pasta</div>
                    <div class="info-valor">''' + (processo.get('pasta', 'N/A')) + '''</div>
                </div>
            </div>
        </div>

        <div class="footer">
            <p>✅ Dashboard do Processo | Sistema Jurídico Agêntico</p>
        </div>
    </div>
</body>
</html>
'''
    
    # Salvar arquivo
    arquivo = f"../data/saida/dashboards/{cnj.replace('/', '-').replace('.', '_')}.html"
    with open(arquivo, 'w', encoding='utf-8') as f:
        f.write(html)

print(f"✅ {len(processos)} dashboards criados com caminhos corrigidos!")
print(f"📍 Pasta: ../data/saida/dashboards/")

