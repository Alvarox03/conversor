#!/bin/bash

echo "		  Conversor            "
echo " ________________________________"
echo "|                                |"
echo "|                                |"
echo "|   1. Decimal a Binario         |"
echo "|   2. Decimal a Octal           |"
echo "|   3. Decimal a Hexadecimal     |"
echo "|                                |"
echo "|________________________________|"

read -p "Eliga qué tipo de conversor desea: " convopt

# Función conversor decimal a binario
decimal_a_binario() {
    read -p "Introduzca su numero decimal: " decimal
    binario=""
    while [ $decimal -gt 0 ]; do
        resto=$((decimal % 2))
        binario="$resto$binario"
        decimal=$((decimal / 2))
    done
    echo $binario
}

# Función conversor decimal a octal
decimal_a_octal() {
    read -p "Introduzca su número decimal: " decimal
    octal=""
    while [ $decimal -gt 0 ]; do
        resto=$((decimal % 8))
        octal="$resto$octal"
        decimal=$((decimal / 8))
    done
    echo $octal
}

# Función conversor decimal a hexadecimal
decimal_a_hexadecimal() {
    read -p "Introduzca su número decimal: " decimal
    hexadecimal=""
    while [ $decimal -gt 0 ]; do
        resto=$((decimal % 16))
        case $resto in
            10) hexadecimal="A$hexadecimal" ;;
            11) hexadecimal="B$hexadecimal" ;;
            12) hexadecimal="C$hexadecimal" ;;
            13) hexadecimal="D$hexadecimal" ;;
            14) hexadecimal="E$hexadecimal" ;;
            15) hexadecimal="F$hexadecimal" ;;
            *) hexadecimal="$resto$hexadecimal" ;;
        esac
        decimal=$((decimal / 16))
    done
    echo $hexadecimal
}

# Menú en caso de que elija alguna de las opciones
case $convopt in
    1)
        respuesta_binario=$(decimal_a_binario)
        echo "El número binario es: $respuesta_binario"
        ;;
    2)
        respuesta_octal=$(decimal_a_octal)
        echo "El número octal es: $respuesta_octal"
        ;;
    3)
        respuesta_hexadecimal=$(decimal_a_hexadecimal)
        echo "El número hexadecimal es: $respuesta_hexadecimal"
        ;;
    *)
        echo "Opción no válida"
        ;;
esac
