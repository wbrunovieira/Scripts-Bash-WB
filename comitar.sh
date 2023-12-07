#!/bin/bash

read -p "Digite a mensagem de commit: " commit_message

git_add_output=$(git add . 2>&1)

status=$(git status --porcelain)

if [[ -z $status ]]; then
    
    echo ""
    echo "Bruno, nao tem nada para enviar. Presta atencao :-)"
else
    
    git_commit_output=$(git commit -m "$commit_message" 2>&1)
    git_push_output=$(git push -u origin main 2>&1)
fi
