#!/bin/bash

echo "🔧 Corrigindo finais de linha para LF em todos os arquivos..."

# Cria ou atualiza .gitattributes para normalizar os principais tipos de arquivos
cat <<EOF > .gitattributes
* text=auto
*.sh text eol=lf
*.json text eol=lf
*.js text eol=lf
*.ts text eol=lf
*.css text eol=lf
*.html text eol=lf
*.md text eol=lf
*.yml text eol=lf
*.yaml text eol=lf
*.py text eol=lf
EOF

echo "�� Atualizando arquivos com finais de linha LF..."
find . -type f -name "*.json" -exec sed -i 's/\r$//' {} \;
find . -type f \( -name "*.sh" -o -name "*.js" -o -name "*.ts" -o -name "*.css" -o -name "*.html" -o -name "*.md" -o -name "*.yml" -o -name "*.yaml" -o -name "*.py" \) -exec sed -i 's/\r$//' {} \;

echo "📦 Renormalizando arquivos no Git..."
git add --renormalize .
git status

echo "✅ Tudo pronto. Agora você pode commitar:"
echo "git commit -m 'Normalize line endings to LF'"

