#!/bin/bash

cd ~/projetos/sistema_advogado/data/saida

# Kanban já foi criado acima, agora só testa

echo "✅ Arquivos prontos:"
ls -lh kanban_integrado_api.html dashboard_integrado_api.html 2>/dev/null || echo "Execute o script acima primeiro"

echo ""
echo "🌐 Abra no navegador:"
echo "   Kanban:    file://$(pwd)/kanban_integrado_api.html"
echo "   Dashboard: file://$(pwd)/dashboard_integrado_api.html"

