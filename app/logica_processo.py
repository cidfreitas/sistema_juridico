"""
Módulo de lógica de negócio para Dashboards Individuais.
Contém funções para determinar a timeline e a próxima ação com base no status do processo.
"""

def gerar_timeline(status):
    """
    Gera timeline baseado no status do processo.
    """
    stages = [
        {'nome': 'Ajuizamento', 'icon': '📝', 'completo': True},
        {'nome': 'Citação', 'icon': '📮', 'completo': True},
        {'nome': 'Resposta', 'icon': '💬', 'completo': status in ['andamento', 'espera', 'urgente']},
        {'nome': 'Prova', 'icon': '🔍', 'completo': status in ['espera', 'urgente']},
        {'nome': 'Sentença', 'icon': '⚖️', 'completo': status == 'encerrado'},
    ]
    return stages

def gerar_proxima_acao(status, data_prazo=None):
    """
    Sugere próxima ação baseado no status.
    """
    sugestoes = {
        'urgente': f'🔴 AÇÃO IMEDIATA: Prazo vencendo em dias ({data_prazo if data_prazo else "Verificar"}). Revisar e preparar resposta urgentemente.',
        'andamento': '🟡 Em progresso: Aguardar manifestação da outra parte ou preparar próxima petição.',
        'espera': '⏸️ Aguardando: Sistema aguarda andamento. Verifique prazos regularmente.',
        'novo': '🟦 Novo: Caso registrado. Revisar completude dos autos e priorização.',
        'encerrado': '✅ Encerrado: Arquivar ou iniciar fase de cumprimento de sentença/execução.',
    }
    return sugestoes.get(status, 'Aguardando próximo andamento.')

def get_status_cores(status):
    """Define cores para o HTML"""
    cores = {
        'urgente': {'bg': '#fbe0e0', 'border': '#e53e3e', 'text': '#c53030'},
        'andamento': {'bg': '#fefcbf', 'border': '#d69e2e', 'text': '#975a16'},
        'espera': {'bg': '#e2e8f0', 'border': '#a0aec0', 'text': '#4a5568'},
        'novo': {'bg': '#ebf8ff', 'border': '#3182ce', 'text': '#2c5282'},
        'encerrado': {'bg': '#ebf5fb', 'border': '#718096', 'text': '#4a5568'},
    }
    return cores.get(status, cores['novo'])

# Integração futura com API:
# Se o status vier da API, basta usar estas funções lá.
