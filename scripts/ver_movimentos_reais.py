import sqlite3
import os

# Caminho do seu banco no Google Drive
DB_PATH = "/Users/cidfreitas/Library/CloudStorage/GoogleDrive-cidfreitas@hotmail.com/Meu Drive/Advocacia/_IA/sistema_juridico/database/sistema_juridico.db"

def ver_movimentos():
    if not os.path.exists(DB_PATH):
        print(f"❌ Banco não encontrado em: {DB_PATH}")
        return

    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()

    print(f"\n🔍 BUSCANDO MOVIMENTOS REAIS (FONTE: TJSP)...")
    print("-" * 80)
    print(f"{'DATA':<12} | {'CNJ':<25} | {'DESCRIÇÃO (RESUMO)'}")
    print("-" * 80)

    # Busca apenas andamentos do TJSP, ordenados do mais novo para o mais antigo
    query = """
    SELECT 
        a.data_andamento, 
        p.cnj, 
        substr(a.descricao, 1, 60) as resumo
    FROM andamentos a
    JOIN processos p ON a.processo_id = p.id
    WHERE a.fonte = 'tjsp'
    ORDER BY a.data_andamento DESC, a.id DESC
    LIMIT 15
    """

    cursor.execute(query)
    rows = cursor.fetchall()

    if not rows:
        print("⚠️  Nenhum movimento do TJSP encontrado.")
        print("   (O scraper pode não ter rodado ainda ou não salvou com fonte='tjsp')")
    else:
        for row in rows:
            data, cnj, desc = row
            # Limpa quebras de linha para visualização
            desc = desc.replace('\n', ' ').replace('\r', '')
            print(f"{data:<12} | {cnj:<25} | {desc}...")

    print("-" * 80)
    
    # Contagem total
    cursor.execute("SELECT COUNT(*) FROM andamentos WHERE fonte='tjsp'")
    total = cursor.fetchone()[0]
    print(f"📊 Total de movimentos TJSP no banco: {total}")
    
    conn.close()

if __name__ == "__main__":
    ver_movimentos()
