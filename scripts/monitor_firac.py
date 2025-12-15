#!/usr/bin/env python3
"""
Monitor FIRAC - Detecta novos .md e processa com FIRAC
"""

import os
import json
import time
from pathlib import Path
from datetime import datetime
import sqlite3
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler
import yaml  # Para ler YAML headers do .md

# ============================================================================
# CONFIGURAÇÃO
# ============================================================================

GOOGLE_DRIVE_PATH = os.path.expanduser(
    "~/Library/CloudStorage/GoogleDrive-cidfreitas@hotmail.com/Meu Drive/Advocacia"
)

DB_PATH = os.path.expanduser(
    "~/Library/CloudStorage/GoogleDrive-cidfreitas@hotmail.com/Meu Drive/Advocacia/_IA/sistema_juridico/database/sistema_juridico.db"
)

PASTA_RAIZ = Path(GOOGLE_DRIVE_PATH)

print("=" * 80)
print("🎯 MONITOR FIRAC")
print("=" * 80)
print(f"📁 Pasta raiz: {PASTA_RAIZ}")
print(f"🗄️  Banco dados: {DB_PATH}")

# ============================================================================
# CLASSE: MONITOR DE MUDANÇAS
# ============================================================================

class FiracEventHandler(FileSystemEventHandler):
    """Detecta mudanças em arquivos .md"""
    
    def on_created(self, event):
        """Quando arquivo novo é criado"""
        if event.is_directory:
            return
        
        # Só processar arquivos .md
        if not event.src_path.endswith('.md'):
            return
        
        print(f"\n✅ ARQUIVO NOVO DETECTADO:")
        print(f"   📄 {event.src_path}")
        
        # Aguardar um pouco (arquivo ainda pode estar sendo escrito)
        time.sleep(2)
        
        # Processar
        processar_arquivo_md(event.src_path)
    
    def on_modified(self, event):
        """Quando arquivo é modificado"""
        if event.is_directory:
            return
        
        if not event.src_path.endswith('.md'):
            return
        
        print(f"\n🔄 ARQUIVO MODIFICADO:")
        print(f"   📄 {event.src_path}")
        
        time.sleep(2)
        processar_arquivo_md(event.src_path)

# ============================================================================
# FUNÇÃO: PROCESSAR ARQUIVO MD
# ============================================================================

def processar_arquivo_md(caminho_arquivo):
    """
    Processa um arquivo .md:
    1. Extrai header YAML
    2. Extrai conteúdo
    3. Chama FIRAC (Claude)
    4. Salva no banco
    """
    
    print(f"\n{'='*80}")
    print(f"🔍 PROCESSANDO: {caminho_arquivo}")
    print(f"{'='*80}")
    
    try:
        # 1. LER ARQUIVO
        with open(caminho_arquivo, 'r', encoding='utf-8') as f:
            conteudo = f.read()
        
        print(f"✅ Arquivo lido ({len(conteudo)} caracteres)")
        
        # 2. EXTRAIR HEADER YAML
        try:
            # Procura ---...--- no início
            if conteudo.startswith('---'):
                partes = conteudo.split('---')
                if len(partes) >= 3:
                    header_yaml = partes[1]
                    conteudo_md = '---'.join(partes[2:]).strip()
                    
                    header = yaml.safe_load(header_yaml)
                    print(f"✅ Header YAML extraído:")
                    print(f"   CNJ: {header.get('processo_id')}")
                    print(f"   Tipo: {header.get('tipo_documento')}")
                    print(f"   Data: {header.get('data_documento')}")
                else:
                    header = {}
                    conteudo_md = conteudo
            else:
                header = {}
                conteudo_md = conteudo
        except Exception as e:
            print(f"⚠️  Erro ao extrair YAML: {e}")
            header = {}
            conteudo_md = conteudo
        
        # 3. EXTRAIR INFORMAÇÕES
        numero_cnj = header.get('processo_id', 'DESCONHECIDO')
        tipo_doc = header.get('tipo_documento', 'desconhecido')
        
        print(f"\n📋 INFORMAÇÕES EXTRAÍDAS:")
        print(f"   CNJ: {numero_cnj}")
        print(f"   Tipo: {tipo_doc}")
        print(f"   Tamanho conteúdo: {len(conteudo_md)} caracteres")
        
        # 4. ENCONTRAR PROCESSO NO BANCO
        conn = sqlite3.connect(DB_PATH)
        cursor = conn.cursor()
        
        cursor.execute("SELECT id FROM processos WHERE cnj = ?", (numero_cnj,))
        resultado = cursor.fetchone()
        
        if not resultado:
            print(f"❌ Processo NÃO ENCONTRADO no banco para CNJ: {numero_cnj}")
            print(f"   Criar processo primeiro!")
            conn.close()
            return
        
        processo_id = resultado[0]
        print(f"✅ Processo encontrado (ID: {processo_id})")
        
        # 5. SALVAR DOCUMENTO
        caminho_relativo = str(Path(caminho_arquivo).relative_to(PASTA_RAIZ))
        
        cursor.execute("""
            INSERT INTO documentos_processo 
            (processo_id, tipo_documento, titulo, data_documento, 
             caminho_arquivo, conteudo_transcrito, status, data_criacao)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        """, (
            processo_id,
            tipo_doc,
            Path(caminho_arquivo).name,
            header.get('data_documento'),
            caminho_relativo,
            conteudo_md,
            'analisado',
            datetime.now().isoformat()
        ))
        
        conn.commit()
        doc_id = cursor.lastrowid
        print(f"✅ Documento salvo no banco (ID: {doc_id})")
        
        # 6. CHAMAR FIRAC (Claude)
        print(f"\n🤖 CHAMANDO FIRAC (Claude)...")
        resultado_firac = chamar_firac_claude(processo_id, conteudo_md, tipo_doc)
        
        if resultado_firac:
            print(f"✅ FIRAC retornou com sucesso")
            
            # 7. SALVAR ANÁLISE FIRAC
            # Obter versão anterior
            cursor.execute(
                "SELECT MAX(versao) FROM analise_firac WHERE processo_id = ?",
                (processo_id,)
            )
            resultado_versao = cursor.fetchone()
            versao_anterior = resultado_versao[0] if resultado_versao[0] else 0
            versao_nova = versao_anterior + 1
            
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
                resultado_firac.get('tribunal'),
                resultado_firac.get('tipo_recurso'),
                resultado_firac.get('numero_processo'),
                json.dumps(resultado_firac.get('fatos', [])),
                resultado_firac.get('questao_central'),
                json.dumps(resultado_firac.get('pontos_controvertidos', [])),
                json.dumps(resultado_firac.get('direito_aplicavel', [])),
                json.dumps(resultado_firac.get('argumentos_autor', [])),
                json.dumps(resultado_firac.get('argumentos_reu', [])),
                resultado_firac.get('conclusao'),
                resultado_firac.get('ratio_decidendi'),
                resultado_firac.get('recomendacao'),
                json.dumps([doc_id]),
                resultado_firac.get('status_caso', 'em_andamento'),
                datetime.now().isoformat()
            ))
            
            conn.commit()
            firac_id = cursor.lastrowid
            
            print(f"✅ Análise FIRAC salva (ID: {firac_id}, versão: {versao_nova})")
            
            # 8. REGISTRAR HISTÓRICO
            cursor.execute("""
                INSERT INTO firac_historico
                (processo_id, versao, motivo, documento_id_trigger, analise_id, data_atualizacao)
                VALUES (?, ?, ?, ?, ?, ?)
            """, (
                processo_id,
                versao_nova,
                f'novo_documento_{tipo_doc}',
                doc_id,
                firac_id,
                datetime.now().isoformat()
            ))
            
            conn.commit()
            print(f"✅ Histórico registrado")
        
        conn.close()
        
        print(f"\n{'='*80}")
        print(f"✅ PROCESSAMENTO COMPLETO!")
        print(f"{'='*80}\n")
        
    except Exception as e:
        print(f"\n❌ ERRO ao processar arquivo:")
        print(f"   {type(e).__name__}: {e}")
        import traceback
        traceback.print_exc()

# ============================================================================
# FUNÇÃO: CHAMAR FIRAC (Claude)
# ============================================================================

def chamar_firac_claude(processo_id, conteudo_md, tipo_doc):
    """
    Chama Claude com seu prompt FIRAC
    Retorna dicionário com análise estruturada
    """
    
    import anthropic
    
    client = anthropic.Anthropic(api_key=os.environ.get('ANTHROPIC_API_KEY'))
    
    # Seu prompt FIRAC
    PROMPT_FIRAC = """[AQUI VOCÊ COLA O PROMPT FIRAC COMPLETO]"""
    
    # Montar mensagem
    mensagem = f"""
{PROMPT_FIRAC}

---

DOCUMENTO FORNECIDO (tipo: {tipo_doc}):

{conteudo_md}

---

Analise este documento aplicando rigorosamente o método FIRAC+ conforme instruído acima.
Retorne um JSON estruturado com as seguintes chaves:
- tribunal
- tipo_recurso
- numero_processo
- fatos (array)
- questao_central
- pontos_controvertidos (array)
- direito_aplicavel (array)
- argumentos_autor (array)
- argumentos_reu (array)
- conclusao
- ratio_decidendi
- recomendacao
- status_caso
"""
    
    print(f"   📤 Enviando para Claude...")
    
    try:
        response = client.messages.create(
            model="claude-opus-4-1-20250805",
            max_tokens=4000,
            messages=[
                {"role": "user", "content": mensagem}
            ]
        )
        
        resposta_text = response.content[0].text
        
        # Tentar extrair JSON
        try:
            # Procurar por {} no response
            import re
            json_match = re.search(r'\{.*\}', resposta_text, re.DOTALL)
            if json_match:
                resultado = json.loads(json_match.group())
                return resultado
            else:
                print(f"   ⚠️  Não encontrado JSON na resposta")
                return None
        except json.JSONDecodeError as e:
            print(f"   ⚠️  Erro ao parsear JSON: {e}")
            print(f"   Resposta bruta: {resposta_text[:200]}...")
            return None
            
    except Exception as e:
        print(f"   ❌ Erro ao chamar Claude: {e}")
        return None

# ============================================================================
# MAIN: INICIAR MONITOR
# ============================================================================

def main():
    """Inicia monitor de pastas"""
    
    print(f"\n🚀 Iniciando monitor FIRAC...")
    print(f"   Monitorando: {PASTA_RAIZ}")
    print(f"   Arquivos: *.md")
    print(f"   Status: AGUARDANDO mudanças...")
    
    event_handler = FiracEventHandler()
    observer = Observer()
    observer.schedule(event_handler, str(PASTA_RAIZ), recursive=True)
    observer.start()
    
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        print(f"\n\n⏹️  Monitor interrompido pelo usuário")
        observer.stop()
    observer.join()

if __name__ == '__main__':
    main()
