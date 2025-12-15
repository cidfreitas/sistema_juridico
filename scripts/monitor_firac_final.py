#!/usr/bin/env python3
"""
Monitor FIRAC Final - Padrão: P-{ID}_{CNJ}
Detecta novos .md em _PEÇAS/ e _SENTENÇAS/ e processa com FIRAC
"""

import os
import re
import json
import time
from pathlib import Path
from datetime import datetime
import sqlite3
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler

GOOGLE_DRIVE_PATH = os.path.expanduser(
    "~/Library/CloudStorage/GoogleDrive-cidfreitas@hotmail.com/Meu Drive/Advocacia"
)

DB_PATH = os.path.expanduser(
    "~/Library/CloudStorage/GoogleDrive-cidfreitas@hotmail.com/Meu Drive/Advocacia/_IA/sistema_juridico/database/sistema_juridico.db"
)

print("=" * 80)
print("🎯 MONITOR FIRAC - PADRÃO P-{ID}_{CNJ}")
print("=" * 80)
print(f"📁 Pasta raiz: {GOOGLE_DRIVE_PATH}")
print(f"🗄️  Banco dados: {DB_PATH}")
print(f"📂 Monitora: _PEÇAS/ e _SENTENÇAS/")

# ============================================================================
# FUNÇÃO: EXTRAIR CNJ DA PASTA
# ============================================================================

def extrair_cnj_da_pasta(caminho_arquivo):
    """
    Extrai CNJ do padrão: P-001312_1010877-57.2025.8.26.0405
    
    Procura subindo a árvore até encontrar a pasta padrão
    Retorna: CNJ (1010877-57.2025.8.26.0405)
    """
    
    caminho = Path(caminho_arquivo)
    
    # Subir até 5 níveis procurando pelo padrão
    for _ in range(5):
        caminho = caminho.parent
        nome = caminho.name
        
        # Procura padrão P-XXXXX_YYYYYYY-YY.YYYY.Y.YY.YYYY
        match = re.search(r'P-(\d+)_(\d{7}-\d{2}\.\d{4}\.\d{1}\.\d{2}\.\d{4})', nome)
        
        if match:
            pasta_id = match.group(1)
            cnj = match.group(2)
            return pasta_id, cnj
    
    return None, None

# ============================================================================
# CLASSE: MONITOR
# ============================================================================

class FiracEventHandler(FileSystemEventHandler):
    
    def on_created(self, event):
        if event.is_directory:
            return
        
        # Só processar .md
        if not event.src_path.endswith('.md'):
            return
        
        # Só processar em _PEÇAS/ ou _SENTENÇAS/
        if '_PEÇAS' not in event.src_path and '_SENTENÇAS' not in event.src_path:
            return
        
        print(f"\n✅ ARQUIVO NOVO DETECTADO:")
        print(f"   📄 {Path(event.src_path).name}")
        
        time.sleep(1)
        processar_arquivo_md(event.src_path)

# ============================================================================
# FUNÇÃO: PROCESSAR ARQUIVO MD
# ============================================================================

def processar_arquivo_md(caminho_arquivo):
    """Processa arquivo .md"""
    
    nome_arquivo = Path(caminho_arquivo).name
    pasta_container = 'PEÇAS' if '_PEÇAS' in caminho_arquivo else 'SENTENÇAS'
    
    print(f"\n{'='*80}")
    print(f"🔍 PROCESSANDO [{pasta_container}]: {nome_arquivo}")
    print(f"{'='*80}")
    
    try:
        # 1. LER ARQUIVO
        with open(caminho_arquivo, 'r', encoding='utf-8') as f:
            conteudo = f.read()
        
        print(f"✅ Arquivo lido ({len(conteudo)} chars)")
        
        # 2. EXTRAIR YAML HEADER
        header = {}
        conteudo_md = conteudo
        
        if conteudo.startswith('---'):
            partes = conteudo.split('---')
            if len(partes) >= 3:
                try:
                    import yaml
                    header = yaml.safe_load(partes[1])
                    conteudo_md = '---'.join(partes[2:]).strip()
                    print(f"✅ Header YAML extraído")
                except Exception as e:
                    print(f"⚠️  Erro ao parsear YAML: {e}")
        
        # 3. EXTRAIR CNJ
        numero_cnj = header.get('processo_id')
        
        if not numero_cnj:
            # Tentar extrair da pasta
            pasta_id, numero_cnj = extrair_cnj_da_pasta(caminho_arquivo)
            if numero_cnj:
                print(f"ℹ️  CNJ extraído da pasta: {numero_cnj}")
        
        if not numero_cnj:
            print(f"❌ CNJ não encontrado (nem em YAML nem na pasta)")
            return
        
        print(f"📋 Informações:")
        print(f"   CNJ: {numero_cnj}")
        print(f"   Tipo: {header.get('tipo_documento', '?')}")
        print(f"   Pasta: {pasta_container}")
        
        # 4. BUSCAR PROCESSO NO BANCO
        conn = sqlite3.connect(DB_PATH)
        cursor = conn.cursor()
        
        cursor.execute("SELECT id FROM processos WHERE cnj = ?", (numero_cnj,))
        resultado = cursor.fetchone()
        
        if not resultado:
            print(f"❌ Processo NÃO ENCONTRADO no banco")
            print(f"   CNJ: {numero_cnj}")
            print(f"   ℹ️  Insira o processo no banco primeiro")
            conn.close()
            return
        
        processo_id = resultado[0]
        print(f"✅ Processo encontrado (ID: {processo_id})")
        
        # 5. SALVAR DOCUMENTO NO BANCO
        tipo_documento = header.get('tipo_documento', f'documento_{pasta_container.lower()}')
        
        cursor.execute("""
            INSERT INTO documentos_processo 
            (processo_id, tipo_documento, titulo, data_documento, 
             caminho_arquivo, conteudo_transcrito, status, data_criacao)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        """, (
            processo_id,
            tipo_documento,
            nome_arquivo,
            header.get('data_documento'),
            str(Path(caminho_arquivo).relative_to(GOOGLE_DRIVE_PATH)),
            conteudo_md,
            'analisado',
            datetime.now().isoformat()
        ))
        
        conn.commit()
        doc_id = cursor.lastrowid
        print(f"✅ Documento salvo no banco (ID: {doc_id})")
        
        # 6. CRIAR ANÁLISE FIRAC (SIMULADA por agora)
        print(f"\n📊 ANÁLISE FIRAC (simulada - integrar Claude depois)")
        
        resultado_firac = {
            'tribunal': 'TJSP',
            'tipo_recurso': tipo_documento,
            'numero_processo': numero_cnj,
            'fatos': [
                {
                    'fato': f'Documento: {nome_arquivo}',
                    'data': str(datetime.now().date()),
                    'importancia': 'média'
                }
            ],
            'questao_central': 'Questão jurídica a ser definida',
            'pontos_controvertidos': [],
            'direito_aplicavel': [],
            'argumentos_autor': [],
            'argumentos_reu': [],
            'conclusao': 'Análise em progresso',
            'ratio_decidendi': '',
            'recomendacao': 'Aguardando análise FIRAC completa',
            'status_caso': 'em_andamento'
        }
        
        # 7. OBTER VERSÃO NOVA
        cursor.execute(
            "SELECT MAX(versao) FROM analise_firac WHERE processo_id = ?",
            (processo_id,)
        )
        resultado_versao = cursor.fetchone()
        versao_anterior = resultado_versao[0] if resultado_versao[0] else 0
        versao_nova = versao_anterior + 1
        
        # 8. SALVAR ANÁLISE FIRAC
        cursor.execute("""
            INSERT INTO analise_firac
            (processo_id, versao, tribunal, tipo_recurso, numero_processo,
             fatos, questao_central, pontos_controvertidos, direito_aplicavel,
             argumentos_autor, argumentos_reu, conclusao, ratio_decidendi,
             recomendacao, documentos_usados, status_caso, data_criacao)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        """, (
            processo_id,
            versao_nova,
            resultado_firac['tribunal'],
            resultado_firac['tipo_recurso'],
            resultado_firac['numero_processo'],
            json.dumps(resultado_firac['fatos']),
            resultado_firac['questao_central'],
            json.dumps(resultado_firac['pontos_controvertidos']),
            json.dumps(resultado_firac['direito_aplicavel']),
            json.dumps(resultado_firac['argumentos_autor']),
            json.dumps(resultado_firac['argumentos_reu']),
            resultado_firac['conclusao'],
            resultado_firac['ratio_decidendi'],
            resultado_firac['recomendacao'],
            json.dumps([doc_id]),
            resultado_firac['status_caso'],
            datetime.now().isoformat()
        ))
        
        conn.commit()
        firac_id = cursor.lastrowid
        print(f"✅ Análise FIRAC salva (ID: {firac_id}, versão: {versao_nova})")
        
        # 9. REGISTRAR HISTÓRICO
        cursor.execute("""
            INSERT INTO firac_historico
            (processo_id, versao, motivo, documento_id_trigger, analise_id, data_atualizacao)
            VALUES (?, ?, ?, ?, ?, ?)
        """, (
            processo_id,
            versao_nova,
            f'novo_documento_{tipo_documento}',
            doc_id,
            firac_id,
            datetime.now().isoformat()
        ))
        
        conn.commit()
        print(f"✅ Histórico registrado")
        
        conn.close()
        
        print(f"\n{'='*80}")
        print(f"✅ PROCESSAMENTO COMPLETO!")
        print(f"   Processo: {numero_cnj}")
        print(f"   Versão FIRAC: {versao_nova}")
        print(f"{'='*80}\n")
        
    except Exception as e:
        print(f"\n❌ ERRO: {type(e).__name__}: {e}")
        import traceback
        traceback.print_exc()

# ============================================================================
# MAIN
# ============================================================================

def main():
    print(f"\n🚀 Iniciando monitor FIRAC...")
    
    event_handler = FiracEventHandler()
    observer = Observer()
    observer.schedule(event_handler, GOOGLE_DRIVE_PATH, recursive=True)
    observer.start()
    
    print(f"   Aguardando mudanças...")
    print(f"   (Crie/modifique arquivos em _PEÇAS/ ou _SENTENÇAS/)")
    
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        print(f"\n\n⏹️  Monitor interrompido")
        observer.stop()
    observer.join()

if __name__ == '__main__':
    main()
