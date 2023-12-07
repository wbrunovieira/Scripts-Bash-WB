#!/bin/bash

read -p "Digite a mensagem de commit: " commit_message

git add .

status=$(git status --porcelain)

if [[ -z $status ]]; then
    
    echo ""
    echo "Bruno, nao tem nada para enviar. Presta atencao :-)"
else
    
    git commit -m "$commit_message"
    git push -u origin main
fi
