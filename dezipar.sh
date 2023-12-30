#!/bin/bash

# Pede o nome do arquivo ZIP
echo "Digite o nome do arquivo ZIP (sem a extensão):"
read arquivo

# Pede o caminho de origem do arquivo ZIP
echo "Digite o caminho completo de origem do arquivo ZIP:"
read caminho_origem

# Pede o caminho de destino onde a pasta será criada
echo "Digite o caminho completo de destino onde a pasta será criada:"
read caminho_destino

# Cria a pasta com o nome do arquivo no caminho de destino
mkdir -p "$caminho_destino/$arquivo"

# Descompacta o arquivo ZIP na pasta criada
unzip "$caminho_origem/$arquivo.zip" -d "$caminho_destino/$arquivo"

echo "Arquivo descompactado com sucesso em $caminho_destino/$arquivo"
