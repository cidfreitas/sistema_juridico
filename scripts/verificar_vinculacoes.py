#!/usr/bin/env python3
"""
Verifica processos vinculados no banco
"""

import sqlite3
import os

DB_PATH = os.path.expanduser("~/Library/CloudStorage/GoogleDrive-cidfreitas@hotmail.com/Meu Drive/Advocacia/_IA/sistema_juridico/database/sistema_juridico.db")

conn = sqlite3.connect(DB_PATH)
cursor = conn.cursor()

print("=" * 80)
print("VERIFICANDO PROCESSOS VINCULADOS NO BANCO")
print("=" * 80)

# 1. Verificar estrutura da tabela
print("\n1️⃣ ESTRUTURA DA TABELA PROCESSOS:")
cursor.execute("PRAGMA table_info(processos)")
colunas = cursor.fetchall()
for col in colunas:
    print(f"   {col[1]} ({col[2]})")

# 2. Contar processos
print("\n2️⃣ TOTAL DE PROCESSOS:")
cursor.execute("SELECT COUNT(*) FROM processos")
total = cursor.fetchone()[0]
print(f"   Total: {total}")

# 3. Verificar se há processos com processo_principal_id preenchido
print("\n3️⃣ PROCESSOS VINCULADOS (com processo_principal_id preenchido):")
cursor.execute("""
    SELECT id, cnj, pasta_sistema, processo_principal_id, tipo_relacao 
    FROM processos 
    WHERE processo_principal_id IS NOT NULL
""")
vinculados = cursor.fetchall()

if not vinculados:
    print("   ❌ NENHUM processo vinculado encontrado!")
    print("   ℹ️ Você precisa preencher 'processo_principal_id' e 'tipo_relacao' no banco")
else:
    print(f"   ✅ {len(vinculados)} processos vinculados encontrados:\n")
    for v in vinculados:
        id_proc, cnj, pasta, id_principal, tipo = v
        print(f"   ID: {id_proc}")
        print(f"   CNJ: {cnj}")
        print(f"   Pasta: {pasta}")
        print(f"   Principal ID: {id_principal}")
        print(f"   Tipo Relação: {tipo}")
        print()

# 4. Mostrar exemplos de dados
print("4️⃣ EXEMPLOS DE DADOS (primeiros 5 processos):")
cursor.execute("""
    SELECT id, cnj, pasta_sistema, status 
    FROM processos 
    LIMIT 5
""")
exemplos = cursor.fetchall()
for ex in exemplos:
    id_proc, cnj, pasta, status = ex
    print(f"   ID: {id_proc} | Pasta: {pasta} | CNJ: {cnj} | Status: {status}")

print("\n" + "=" * 80)
print("FIM DA VERIFICAÇÃO")
print("=" * 80)

conn.close()
