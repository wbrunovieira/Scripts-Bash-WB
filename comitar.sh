#!/bin/bash

read -p "Digite a mensagem de commit: " commit_message

git add .

git commit -m "$commit_message"

git push -u origin main
