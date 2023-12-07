#!/bin/bash

read -p "Digite a mensagem de commit: " commit_message

unstaged=$(git diff --name-only)
untracked=$(git ls-files --others --exclude-standard)

status=$(git status --porcelain)

if [[ -z "$unstaged" && -z "$untracked" ]]; then
    
    echo ""
    echo "Bruno, nao tem nada para enviar. Presta atencao :-)"
else
    git add .
    git commit -m "$commit_message"
    git push -u origin main 
fi
