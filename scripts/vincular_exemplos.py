#!/usr/bin/env python3
"""
Vincula processos de exemplo para testes
"""

import sqlite3
import os

DB_PATH = os.path.expanduser("~/Library/CloudStorage/GoogleDrive-cidfreitas@hotmail.com/Meu Drive/Advocacia/_IA/sistema_juridico/database/sistema_juridico.db")

conn = sqlite3.connect(DB_PATH)
cursor = conn.cursor()

print("=" * 80)
print("VINCULANDO PROCESSOS DE EXEMPLO")
print("=" * 80)

# CNJs para vincular
cnj_principal = "1002677-95.2016.8.26.0431"  # Mais antigo = principal
cnj_agravo = "0001176-50.2021.8.26.0431"     # Apelação
cnj_cumprimento = "2070747-04.2024.8.26.0000"  # Cumprimento (será recurso_de)

# 1. Obter ID do processo principal
cursor.execute("SELECT id FROM processos WHERE cnj = ?", (cnj_principal,))
resultado = cursor.fetchone()
if not resultado:
    print(f"❌ Processo principal não encontrado: {cnj_principal}")
    conn.close()
    exit(1)

id_principal = resultado[0]
print(f"\n✅ Processo Principal encontrado:")
print(f"   ID: {id_principal}")
print(f"   CNJ: {cnj_principal}")

# 2. Vincular apelação
cursor.execute("SELECT id FROM processos WHERE cnj = ?", (cnj_agravo,))
resultado = cursor.fetchone()
if resultado:
    id_agravo = resultado[0]
    cursor.execute("""
        UPDATE processos 
        SET processo_principal_id = ?, tipo_relacao = ?
        WHERE id = ?
    """, (id_principal, "apelacao_de", id_agravo))
    print(f"\n✅ Apelação vinculada:")
    print(f"   ID: {id_agravo}")
    print(f"   CNJ: {cnj_agravo}")
    print(f"   Tipo: apelacao_de")
else:
    print(f"\n❌ Apelação não encontrada: {cnj_agravo}")

# 3. Vincular cumprimento
cursor.execute("SELECT id FROM processos WHERE cnj = ?", (cnj_cumprimento,))
resultado = cursor.fetchone()
if resultado:
    id_cumprimento = resultado[0]
    cursor.execute("""
        UPDATE processos 
        SET processo_principal_id = ?, tipo_relacao = ?
        WHERE id = ?
    """, (id_principal, "recurso_de", id_cumprimento))
    print(f"\n✅ Cumprimento de Sentença vinculado:")
    print(f"   ID: {id_cumprimento}")
    print(f"   CNJ: {cnj_cumprimento}")
    print(f"   Tipo: recurso_de")
else:
    print(f"\n❌ Cumprimento não encontrado: {cnj_cumprimento}")

conn.commit()

# 4. Verificar resultado
print("\n" + "=" * 80)
print("VERIFICANDO VINCULAÇÕES")
print("=" * 80)

cursor.execute("""
    SELECT id, cnj, pasta_sistema, processo_principal_id, tipo_relacao 
    FROM processos 
    WHERE processo_principal_id = ? OR cnj IN (?, ?, ?)
    ORDER BY id
""", (id_principal, cnj_principal, cnj_agravo, cnj_cumprimento))

registros = cursor.fetchall()
for reg in registros:
    id_proc, cnj, pasta, id_princ, tipo_rel = reg
    if id_princ is None:
        print(f"\n🔴 PRINCIPAL:")
    else:
        print(f"\n🔗 VINCULADO:")
    print(f"   ID: {id_proc}")
    print(f"   CNJ: {cnj}")
    print(f"   Pasta: {pasta}")
    print(f"   Tipo: {tipo_rel or 'principal'}")

print("\n" + "=" * 80)
print("✅ VINCULAÇÃO CONCLUÍDA!")
print("=" * 80)

conn.close()
