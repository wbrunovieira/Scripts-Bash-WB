#!/bin/bash

# Verifica se o Git e o GitHub CLI estão instalados
if ! command -v git &> /dev/null || ! command -v gh &> /dev/null
then
    echo "Erro: Git ou GitHub CLI não estão instalados."
    exit 1
fi

# Pergunta pelo nome do repositório
echo "Digite o nome do repositório:"
read repo_name

# Pergunta pelas tecnologias usadas
echo "Digite as tecnologias usadas, separadas por vírgula:"
read techs

# Cria o repositório no GitHub
if ! gh repo create $repo_name --public; then
    echo "Erro ao criar o repositório no GitHub."
    exit 1
fi

# Inicializa o repositório Git
git init || { echo "Erro ao inicializar o repositório Git."; exit 1; }

# Adiciona todos os arquivos
git add . || { echo "Erro ao adicionar arquivos."; exit 1; }

# Realiza o commit inicial com a mensagem das tecnologias
git commit -m "Início de projeto com as tecnologias: $techs" || { echo "Erro ao realizar commit."; exit 1; }

# Mudar para a branch main
git branch -M main || { echo "Erro ao mudar para a branch main."; exit 1; }

# Obtém o nome de usuário do GitHub
git_user=$(gh api user | jq -r '.login')

# Adiciona o repositório remoto e realiza o push
git remote add origin https://github.com/$git_user/$repo_name.git
git push -u origin main || { echo "Erro ao realizar push para o GitHub."; exit 1; }

# Exibe o status do Git
git status

