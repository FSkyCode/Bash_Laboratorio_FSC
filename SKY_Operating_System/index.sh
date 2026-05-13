#!/bin/bash

PANTALLA="PANTALLA_BLOQUEO"

USUARIO_ACTUAL="SkyBot"
USUARIO_CONTRASEÑA="123"

apps=("ABRIR ALMACENAMIENTO" "ABRIR TERMINAL" "APAGAR SISTEMA")

seleccion=0

pantalla_bloqueo() {
    clear

    echo "-- PANTALLA DE BLOQUEO --"
    echo ""
    echo "Usuario: $USUARIO_ACTUAL"

    read -p "Contraseña: " r
    echo ""

    if [ "$r" = "$USUARIO_CONTRASEÑA" ]; then
        PANTALLA="INICIO"
    fi
}

inicio() {
    clear

    echo "-- APPS --"
    echo ""

    inicio=$((seleccion - 1))
    fin=$((seleccion + 1))

    if [ $inicio -lt 0 ]; then
        inicio=0
    fi

    if [ $fin -ge ${#apps[@]} ]; then
        fin=$((${#apps[@]} - 1))
    fi

    for ((i=inicio; i<=fin; i++))
    do
        if [ $i -eq $seleccion ]; then
            printf "\e[47m\e[30m"
            echo "${apps[$i]}"
            printf "\e[0m\n"
        else
            echo "${apps[$i]}"
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

    if [ $seleccion -ge ${#apps[@]} ]; then
        seleccion=$((${#apps[@]} - 1))
    fi
}

while true; do
    if [ "$PANTALLA" = "PANTALLA_BLOQUEO" ]; then
        pantalla_bloqueo
    elif [ "$PANTALLA" = "INICIO" ]; then
        inicio
    fi
done
