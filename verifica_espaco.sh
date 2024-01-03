#!/bin/bash

# Obtém a saída do comando df -h e processa linha por linha
df -h | while read line; do
    if [[ $line == /dev/* ]]; then
        # Extrai os campos de interesse
        filesystem=$(echo $line | awk '{print $1}')
        size=$(echo $line | awk '{print $2}')
        used=$(echo $line | awk '{print $3}')
        available=$(echo $line | awk '{print $4}')
        capacity=$(echo $line | awk '{print $5}')

        # Calcula a porcentagem livre
        percent_free=$(echo $capacity | tr -d '%')
        percent_free=$((100 - percent_free))

        # Formata e exibe a mensagem
        echo "Filesystem: $filesystem, Tamanho Total: $size, Usado: $used, Disponível: $available, Capacidade Usada: $capacity, Espaço Livre: $percent_free%"
    fi
done

# A variável $espaco precisa ser definida. Por exemplo:
espaco="Verificação de Espaço: $(df -h | grep '/$')"

# Usa osascript para enviar a notificação
osascript -e "display notification \"$espaco\" with title \"Espaço em Disco\""

