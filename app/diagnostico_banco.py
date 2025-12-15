import sqlite3
import os

# Conecta no banco
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DB_PATH = os.path.join(BASE_DIR, '..', 'database', 'sistema_juridico.db')

print(f"\n🔍 ANALISANDO BANCO DE DADOS: {DB_PATH}\n")

try:
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()

    # 1. Ver Tabelas
    print("=== TABELAS EXISTENTES ===")
    tables = cursor.execute("SELECT name FROM sqlite_master WHERE type='table';").fetchall()
    for t in tables:
        print(f" - {t[0]}")
        # Mostrar colunas de cada tabela importante
        if t[0] in ['processos', 'andamentos']:
            print(f"   COLUNAS de {t[0]}:")
            cols = cursor.execute(f"PRAGMA table_info({t[0]})").fetchall()
            for c in cols:
                print(f"     * {c[1]}") # Nome da coluna

    # 2. Ver Quantidade de Dados
    print("\n=== CONTAGEM DE DADOS ===")
    try:
        n_proc = cursor.execute("SELECT COUNT(*) FROM processos").fetchone()[0]
        print(f"Processos: {n_proc}")
    except: print("Erro ao ler processos")

    try:
        n_and = cursor.execute("SELECT COUNT(*) FROM andamentos").fetchone()[0]
        print(f"Andamentos: {n_and}")
    except: print("Erro ao ler andamentos")

    # 3. Espiar um Processo
    print("\n=== EXEMPLO DE PROCESSO (Para ver nomes das partes) ===")
    try:
        # Pega o primeiro processo para ver quais campos estão preenchidos
        proc = cursor.execute("SELECT * FROM processos LIMIT 1").fetchone()
        for i, col in enumerate(cursor.description):
            print(f"{col[0]}: {proc[i]}")
    except: print("Nenhum processo encontrado.")

    conn.close()

except Exception as e:
    print(f"❌ ERRO CRÍTICO: {e}")

print("\n✅ Fim do Diagnóstico.")
