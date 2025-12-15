#!/usr/bin/env python3
"""
Cria schema SQLite completo para Sistema Jurídico
"""

import sqlite3
from datetime import datetime
import os

# Usar o caminho exato com Google Drive
DB_DIR = os.path.expanduser("~/Library/CloudStorage/GoogleDrive-cidfreitas@hotmail.com/Meu Drive/Advocacia/_IA/sistema_juridico/database")
os.makedirs(DB_DIR, exist_ok=True)

DB_PATH = os.path.join(DB_DIR, "sistema_juridico.db")

print(f"📁 Criando banco em: {DB_PATH}\n")

conn = sqlite3.connect(DB_PATH)
cursor = conn.cursor()

print("=" * 80)
print("CRIANDO SCHEMA SQLITE - SISTEMA JURÍDICO AGÊNTICO")
print("=" * 80)

# 1. TABELA: PROCESSOS
cursor.execute("""
CREATE TABLE IF NOT EXISTS processos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cnj TEXT UNIQUE NOT NULL,
    tipo_processo TEXT NOT NULL CHECK(tipo_processo IN ('principal', 'apelacao', 'resp', 'agravo', 'embargo')),
    status TEXT NOT NULL CHECK(status IN ('urgente', 'andamento', 'espera', 'novo', 'arquivado')),
    
    processo_principal_id INTEGER,
    tipo_relacao TEXT CHECK(tipo_relacao IN ('agravo_de', 'embargo_de', 'apelacao_de', 'resp_de', 'recurso_de')),
    
    tribunal TEXT NOT NULL CHECK(tribunal IN ('1ª Instância', 'TJSP', 'STJ', 'STF')),
    foro TEXT,
    vara TEXT,
    
    parte_principal TEXT NOT NULL,
    parte_adversa TEXT,
    
    codigo_primeira_instancia TEXT,
    codigo_segunda_instancia TEXT,
    
    pasta_sistema TEXT NOT NULL,
    
    data_ajuizamento DATE,
    data_distribuicao DATE,
    ultimo_andamento_data DATE,
    proximo_prazo_data DATE,
    dias_para_prazo INTEGER,
    
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_modificacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario_criacao TEXT DEFAULT 'sistema',
    
    FOREIGN KEY (processo_principal_id) REFERENCES processos(id)
);
""")
print("✅ Tabela PROCESSOS criada")

# 2. TABELA: ANDAMENTOS
cursor.execute("""
CREATE TABLE IF NOT EXISTS andamentos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    processo_id INTEGER NOT NULL,
    
    data_andamento DATE NOT NULL,
    tipo_andamento TEXT NOT NULL,
    descricao TEXT NOT NULL,
    
    data_scraping TIMESTAMP,
    fonte TEXT CHECK(fonte IN ('tjsp', 'stj', 'stf', 'manual', 'email')),
    
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (processo_id) REFERENCES processos(id) ON DELETE CASCADE,
    UNIQUE(processo_id, data_andamento, descricao)
);
""")
print("✅ Tabela ANDAMENTOS criada")

# 3. TABELA: PRAZOS
cursor.execute("""
CREATE TABLE IF NOT EXISTS prazos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    processo_id INTEGER NOT NULL,
    
    tipo_prazo TEXT NOT NULL,
    descricao TEXT,
    data_vencimento DATE NOT NULL,
    dias_restantes INTEGER,
    
    status TEXT DEFAULT 'aberto' CHECK(status IN ('aberto', 'vencido', 'cumprido', 'prorrogado')),
    
    alerta_enviado BOOLEAN DEFAULT 0,
    data_alerta TIMESTAMP,
    
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_modificacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (processo_id) REFERENCES processos(id) ON DELETE CASCADE
);
""")
print("✅ Tabela PRAZOS criada")

# 4. TABELA: ARQUIVOS
cursor.execute("""
CREATE TABLE IF NOT EXISTS arquivos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    processo_id INTEGER NOT NULL,
    
    nome_arquivo TEXT NOT NULL,
    caminho_arquivo TEXT NOT NULL,
    tipo_arquivo TEXT,
    tamanho_bytes INTEGER,
    
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (processo_id) REFERENCES processos(id) ON DELETE CASCADE
);
""")
print("✅ Tabela ARQUIVOS criada")

# 5. TABELA: AUDITORIA
cursor.execute("""
CREATE TABLE IF NOT EXISTS auditoria (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    
    processo_id INTEGER,
    
    tipo_evento TEXT NOT NULL CHECK(tipo_evento IN 
        ('criado', 'modificado', 'status_mudou', 'prazo_adicionado', 
         'andamento_adicionado', 'arquivo_adicionado', 'deletado', 'restaurado')),
    
    tabela_afetada TEXT,
    registro_id INTEGER,
    
    usuario TEXT NOT NULL DEFAULT 'sistema',
    valor_anterior TEXT,
    valor_novo TEXT,
    detalhes TEXT,
    
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (processo_id) REFERENCES processos(id)
);
""")
print("✅ Tabela AUDITORIA criada")

# 6. TABELA: CONFIGURAÇÕES
cursor.execute("""
CREATE TABLE IF NOT EXISTS configuracoes (
    chave TEXT PRIMARY KEY,
    valor TEXT,
    tipo TEXT,
    descricao TEXT,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
""")
print("✅ Tabela CONFIGURAÇÕES criada")

# Inserir configurações padrão
cursor.execute("DELETE FROM configuracoes")
configs = [
    ('advogado_nome', 'Cid Freitas', 'string', 'Nome do advogado'),
    ('advogado_oab', '', 'string', 'OAB do advogado'),
    ('email_alertas', 'cidfreitas@hotmail.com', 'string', 'Email para alertas'),
    ('dias_alerta_critico', '3', 'integer', 'Dias antes do prazo para alertar'),
    ('dias_alerta_warning', '7', 'integer', 'Dias antes do prazo para alertar'),
    ('scraper_ultima_execucao', '', 'datetime', 'Última execução scraper'),
    ('backup_ultimo', '', 'datetime', 'Último backup'),
]
for chave, valor, tipo, descricao in configs:
    cursor.execute("""
        INSERT INTO configuracoes (chave, valor, tipo, descricao)
        VALUES (?, ?, ?, ?)
    """, (chave, valor, tipo, descricao))

print("✅ Configurações padrão inseridas")

# 7. CRIAR ÍNDICES
cursor.execute("CREATE INDEX IF NOT EXISTS idx_processos_cnj ON processos(cnj)")
cursor.execute("CREATE INDEX IF NOT EXISTS idx_processos_status ON processos(status)")
cursor.execute("CREATE INDEX IF NOT EXISTS idx_andamentos_processo ON andamentos(processo_id)")
cursor.execute("CREATE INDEX IF NOT EXISTS idx_prazos_processo ON prazos(processo_id)")
cursor.execute("CREATE INDEX IF NOT EXISTS idx_auditoria_processo ON auditoria(processo_id)")

print("✅ Índices criados")

# Commit
conn.commit()

# Verificar
print("\n" + "=" * 80)
print("SCHEMA CRIADO COM SUCESSO!")
print("=" * 80)

cursor.execute("SELECT name FROM sqlite_master WHERE type='table'")
tabelas = cursor.fetchall()
print(f"\n✅ {len(tabelas)} Tabelas criadas:")
for (tabela,) in tabelas:
    print(f"   ├─ {tabela}")

print(f"\n📁 Banco de dados:")
print(f"   {DB_PATH}")

# Backup schema
schema_backup = DB_PATH.replace('.db', '_schema.sql')
with open(schema_backup, 'w') as f:
    for linha in conn.iterdump():
        f.write(f"{linha}\n")
print(f"\n💾 Schema backup:")
print(f"   {schema_backup}")

conn.close()

print("\n✅ PRONTO PARA MIGRAÇÃO!")

