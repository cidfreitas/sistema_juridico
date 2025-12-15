#!/usr/bin/env python3
"""
Gera Kanban com links para abrir dashboards ao clicar
"""

import json

# Ler JSON
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

# Converter processos para JSON string
processos_json = json.dumps(processos, ensure_ascii=False)

# HTML com Links para Dashboard
html = '''<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kanban Jurídico - Sistema</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }
        
        .container { max-width: 1600px; margin: 0 auto; }
        
        .header {
            text-align: center;
            color: white;
            margin-bottom: 30px;
            text-shadow: 0 2px 10px rgba(0,0,0,0.3);
        }
        
        .header h1 { font-size: 2.5em; margin-bottom: 10px; }
        .header p { font-size: 1.1em; opacity: 0.9; }
        
        .info {
            background: rgba(255,255,255,0.1);
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            text-align: center;
            font-size: 0.95em;
        }
        
        .kanban-board {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .kanban-column {
            background: white;
            border-radius: 8px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }
        
        .column-header {
            padding: 15px;
            font-weight: 600;
            font-size: 1.1em;
            border-bottom: 3px solid;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .column-header.urgente { 
            background: #fff5f5; 
            border-bottom-color: #e74c3c; 
            color: #c0392b; 
        }
        .column-header.andamento { 
            background: #fff9f0; 
            border-bottom-color: #f39c12; 
            color: #d68910; 
        }
        .column-header.espera { 
            background: #f5f5f5; 
            border-bottom-color: #95a5a6; 
            color: #7f8c8d; 
        }
        .column-header.novo { 
            background: #f0f9ff; 
            border-bottom-color: #3498db; 
            color: #2980b9; 
        }
        
        .badge {
            background: rgba(0,0,0,0.1);
            padding: 4px 10px;
            border-radius: 12px;
            font-size: 0.85em;
            font-weight: 700;
        }
        
        .cards-container {
            padding: 15px;
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 10px;
            overflow-y: auto;
            min-height: 400px;
            background: transparent;
            transition: all 0.3s;
        }
        
        .cards-container.drag-over {
            background: rgba(100, 150, 255, 0.1);
            border-radius: 4px;
        }
        
        .process-card {
            background: #f8f9fa;
            border: 2px solid #e0e0e0;
            border-radius: 6px;
            padding: 12px;
            cursor: grab;
            transition: all 0.2s;
            border-left: 4px solid #3498db;
            user-select: none;
            position: relative;
            text-decoration: none;
            display: block;
            color: inherit;
        }
        
        .process-card:active { cursor: grabbing; }
        
        .process-card:hover { 
            box-shadow: 0 5px 15px rgba(0,0,0,0.1); 
            transform: translateY(-2px);
        }
        
        .process-card.dragging {
            opacity: 0.5;
            transform: rotate(2deg);
        }
        
        .process-card.drag-over-card {
            border-top: 3px solid #3498db;
            padding-top: 9px;
        }
        
        .process-card.urgente { 
            border-left-color: #e74c3c; 
            background: #fadbd8; 
        }
        .process-card.andamento { 
            border-left-color: #f39c12; 
            background: #fdebd0; 
        }
        .process-card.espera { 
            border-left-color: #95a5a6; 
            background: #f4f6f7; 
        }
        .process-card.novo { 
            border-left-color: #3498db; 
            background: #ebf5fb; 
        }
        
        .card-cnj {
            font-weight: 600;
            font-size: 0.9em;
            color: #2c3e50;
            margin-bottom: 6px;
            font-family: 'Courier New', monospace;
            word-break: break-all;
        }
        
        .card-parte {
            font-size: 0.8em;
            color: #555;
            margin-bottom: 4px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        
        .card-meta {
            font-size: 0.75em;
            color: #888;
            margin-top: 8px;
            padding-top: 8px;
            border-top: 1px solid rgba(0,0,0,0.1);
            display: flex;
            justify-content: space-between;
        }
        
        .card-link-hint {
            font-size: 0.7em;
            color: #999;
            margin-top: 6px;
            text-align: right;
        }
        
        .stats {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
        }
        
        .stat-card {
            background: white;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .stat-number {
            font-size: 2.5em;
            font-weight: 700;
            color: #667eea;
            margin-bottom: 5px;
        }
        
        .stat-label { font-size: 0.95em; color: #666; }
        
        .footer {
            text-align: center;
            color: white;
            margin-top: 30px;
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>⚖️ Kanban Jurídico</h1>
            <p>Clique em um processo para abrir o Dashboard</p>
        </div>
        
        <div class="info">
            💡 Dicas: Arraste para reordenar OU clique para abrir Dashboard
        </div>

        <div class="kanban-board" id="kanban"></div>

        <div class="stats" id="stats"></div>
        
        <div class="footer">
            <p>✅ Mudanças salvas automaticamente</p>
        </div>
    </div>

    <script>
        const processosData = ''' + processos_json + ''';
        
        const estado = {
            'urgente': [],
            'andamento': [],
            'espera': [],
            'novo': []
        };
        
        function carregarEstado() {
            const salvo = localStorage.getItem('kanban_estado');
            if (salvo) {
                try {
                    return JSON.parse(salvo);
                } catch(e) {
                    console.log('Erro ao carregar estado salvo');
                }
            }
            
            processosData.forEach(p => {
                if (estado[p.status]) {
                    estado[p.status].push(p);
                }
            });
            
            return estado;
        }
        
        const estadoAtual = carregarEstado();
        
        function salvarEstado() {
            localStorage.setItem('kanban_estado', JSON.stringify(estadoAtual));
            atualizarStats();
        }
        
        function gerarLinkDashboard(cnj) {
            const cnj_sanitizado = cnj.replace(/\\//g, '-').replace(/\\./g, '_');
            return `dashboards/${cnj_sanitizado}.html`;
        }
        
        function renderizar() {
            const kanban = document.getElementById('kanban');
            kanban.innerHTML = '';
            
            const statusInfo = {
                'urgente': '🔴 URGENTE',
                'andamento': '🟡 EM ANDAMENTO',
                'espera': '⏸️ EM ESPERA',
                'novo': '🟦 NOVOS'
            };
            
            Object.entries(estadoAtual).forEach(([status, processos]) => {
                const col = document.createElement('div');
                col.className = 'kanban-column';
                
                let cardsHTML = '';
                processos.forEach((p, idx) => {
                    const linkDash = gerarLinkDashboard(p.cnj);
                    cardsHTML += `
                        <a href="${linkDash}" class="process-card ${status}" draggable="true" data-cnj="${p.cnj}" data-index="${idx}" onclick="return handleCardClick(event)">
                            <div class="card-cnj">${p.cnj}</div>
                            <div class="card-parte">${p.parte.substring(0, 40)}...</div>
                            <div class="card-meta">
                                <span>📊 ${p.total_andamentos}</span>
                                <span>${p.pasta}</span>
                            </div>
                            <div class="card-link-hint">Clique para abrir →</div>
                        </a>
                    `;
                });
                
                col.innerHTML = `
                    <div class="column-header ${status}">
                        <span>${statusInfo[status]}</span>
                        <span class="badge">${processos.length}</span>
                    </div>
                    <div class="cards-container" data-status="${status}">
                        ${cardsHTML}
                    </div>
                `;
                
                kanban.appendChild(col);
            });
            
            document.querySelectorAll('.process-card').forEach(card => {
                card.addEventListener('dragstart', dragStart);
                card.addEventListener('dragend', dragEnd);
                card.addEventListener('dragover', cardDragOver);
                card.addEventListener('dragleave', cardDragLeave);
                card.addEventListener('drop', cardDrop);
            });
            
            document.querySelectorAll('.cards-container').forEach(container => {
                container.addEventListener('dragover', dragOver);
                container.addEventListener('dragleave', dragLeave);
                container.addEventListener('drop', drop);
            });
        }
        
        let draggedCard = null;
        let draggedFromStatus = null;
        let draggedIndex = null;
        let isDragging = false;
        
        function dragStart(e) {
            isDragging = true;
            draggedCard = this;
            draggedFromStatus = this.parentElement.dataset.status;
            draggedIndex = Array.from(this.parentElement.children).indexOf(this);
            this.classList.add('dragging');
        }
        
        function dragEnd(e) {
            isDragging = false;
            if (draggedCard) {
                draggedCard.classList.remove('dragging');
                document.querySelectorAll('.process-card').forEach(card => {
                    card.classList.remove('drag-over-card');
                });
                draggedCard = null;
            }
        }
        
        function handleCardClick(e) {
            if (isDragging) {
                e.preventDefault();
                return false;
            }
            return true;
        }
        
        function dragOver(e) {
            e.preventDefault();
            this.classList.add('drag-over');
        }
        
        function dragLeave(e) {
            this.classList.remove('drag-over');
        }
        
        function cardDragOver(e) {
            e.preventDefault();
            if (draggedCard !== this) {
                this.classList.add('drag-over-card');
            }
        }
        
        function cardDragLeave(e) {
            this.classList.remove('drag-over-card');
        }
        
        function cardDrop(e) {
            e.preventDefault();
            e.stopPropagation();
            
            const targetContainer = this.parentElement;
            const targetStatus = targetContainer.dataset.status;
            
            if (!draggedCard) return;
            
            const cnj = draggedCard.dataset.cnj;
            const procIndex = estadoAtual[draggedFromStatus].findIndex(p => p.cnj === cnj);
            if (procIndex > -1) {
                const [processo] = estadoAtual[draggedFromStatus].splice(procIndex, 1);
                const cards = Array.from(targetContainer.querySelectorAll('.process-card'));
                const targetIndex = cards.indexOf(this);
                processo.status = targetStatus;
                estadoAtual[targetStatus].splice(targetIndex, 0, processo);
                salvarEstado();
                renderizar();
            }
        }
        
        function drop(e) {
            e.preventDefault();
            this.classList.remove('drag-over');
            
            if (!draggedCard) return;
            
            const cnj = draggedCard.dataset.cnj;
            const novoStatus = this.dataset.status;
            
            if (draggedFromStatus !== novoStatus) {
                const procIndex = estadoAtual[draggedFromStatus].findIndex(p => p.cnj === cnj);
                if (procIndex > -1) {
                    const [processo] = estadoAtual[draggedFromStatus].splice(procIndex, 1);
                    processo.status = novoStatus;
                    estadoAtual[novoStatus].push(processo);
                    salvarEstado();
                    renderizar();
                }
            }
        }
        
        function atualizarStats() {
            const stats = document.getElementById('stats');
            stats.innerHTML = `
                <div class="stat-card">
                    <div class="stat-number">${estadoAtual.urgente.length}</div>
                    <div class="stat-label">🔴 Urgentes</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">${estadoAtual.andamento.length}</div>
                    <div class="stat-label">🟡 Andamento</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">${estadoAtual.espera.length}</div>
                    <div class="stat-label">⏸️ Espera</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">${estadoAtual.novo.length}</div>
                    <div class="stat-label">🟦 Novos</div>
                </div>
            `;
        }
        
        renderizar();
        atualizarStats();
        
        console.log('✅ Kanban com links para dashboards carregado!');
    </script>
</body>
</html>
'''

# Salvar
with open("../data/saida/kanban_interativo.html", 'w', encoding='utf-8') as f:
    f.write(html)

print("✅ Kanban com links para dashboards criado!")
print("📍 Arquivo: ../data/saida/kanban_interativo.html")

