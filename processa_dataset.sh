#!/bin/bash

# Caminho para a pasta principal contendo os pacientes
main_folder="MMU-Iris-Database"

# Percorre todos os pacientes
for patient_folder in "$main_folder"/*; do
    # Ignora arquivos que não são pastas
    if [ ! -d "$patient_folder" ]; then
        continue
    fi

    echo "Processando paciente: $(basename "$patient_folder")"

    # Verifica se a pasta "left" existe e move as imagens para a pasta do paciente
    left_folder="$patient_folder/left"
    if [ -d "$left_folder" ]; then
        # Move as imagens .bmp para a pasta do paciente
        mv "$left_folder"/*.bmp "$patient_folder/"
        
        # Remove a pasta "left"
        rm -r "$left_folder"
    else
        echo "Pasta 'left' não encontrada para o paciente: $(basename "$patient_folder")"
    fi

    # Remove a pasta "right" se ela existir
    right_folder="$patient_folder/right"
    if [ -d "$right_folder" ]; then
        rm -r "$right_folder"
    fi
done
