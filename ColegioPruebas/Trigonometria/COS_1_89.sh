#!/bin/bash

seleccion=0

while true; do
    clear

    echo "COSENO"

    inicio=$((seleccion - 1))
    fin=$((seleccion + 1))

    if [ $inicio -lt 0 ]; then
        inicio=0
    fi

    if [ $fin -gt 90 ]; then
        fin=90
    fi

    for ((numero=inicio; numero<=fin; numero++))
    do
        rad=$(echo "$numero * 4*a(1) / 180" | bc -l)
        coseno=$(echo "c($rad)" | bc -l)

        texto=$(printf "Cos(%02d) = %.2f" "$numero" "$coseno")

        if [ $numero -eq $seleccion ]; then
            printf "\e[47m\e[30m"
            echo "$texto"
            printf "\e[0m"
        else
            echo "$texto"
        fi
    done

    read -rsn1 tecla

    if [[ $tecla == $'\x1b' ]]; then
        read -rsn2 tecla

        case $tecla in
            '[A')
                ((seleccion--))
                ;;
            '[B')
                ((seleccion++))
                ;;
        esac
    fi

    if [ $seleccion -lt 0 ]; then
        seleccion=0
    fi

    if [ $seleccion -gt 90 ]; then
        seleccion=90
    fi
done
