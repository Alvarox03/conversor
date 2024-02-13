#!/bin/bash

echo "		  Conversor            "
echo " ________________________________"
echo "|                                |"
echo "|                                |"
echo "|   1. Binario a Decimal         |"
echo "|   2. Binario a Octal           |"
echo "|   3. Binario a Hexadecimal     |"
echo "|                                |"
echo "|________________________________|"

read -p "Elige qué tipo de conversor deseas: " convopt

#Funcion para registrar la conversión
function registro(){
    local tipo_conversion=$1
    local numero_hexadecimal=$2
    local resultado=$3
    local fecha=$(date +"%d/%m/%Y")
    if [ "$numero_hexadecimal" != "" ]; then
        echo "$fecha $tipo_conversion $numero_hexadecimal $resultado" >> registro.txt
    fi
}

# Función conversor Binario a octal
binario_a_octal() {
    decimal=$(binario_a_decimal)
    octal=""
    while [ $decimal -gt 0 ]
    do
        resto=$((decimal % 8))
        octal="$resto$octal"
        decimal=$((decimal / 8))
    done
    registro "binario octal" "$binario" "$octal"
    echo $octal
}

# Función conversor Binario a hexadecimal
binario_a_hexadecimal() {
    decimal=$(binario_a_decimal)
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
    registro "binario hexadecimal" "$binario" "$hexadecimal"
    echo $hexadecimal
}

# Función conversor Binario a decimal
binario_a_decimal() {
    read -p "Introduce tu numero binario: " binario
    decimal=0
    i=0
    while [ $binario -ne 0 ]
    do
        digito=$((binario % 10))
        decimal=$((decimal + digito * 2**i))
        i=$((i + 1))
        binario=$((binario / 10))
    done
    registro "binario decimal" "$binario" "$decimal"
    echo $decimal
}

# Menú en caso de que elija alguna de las opciones
case $convopt in
    1)
        respuesta_decimal=$(binario_a_decimal)
        echo "El número decimal es: $respuesta_decimal"
        ;;
    2)
        respuesta_octal=$(binario_a_octal)
        echo "El número octal es: $respuesta_octal"
        ;;
    3)
        respuesta_hexadecimal=$(binario_a_hexadecimal)
        echo "El número hexadecimal es: $respuesta_hexadecimal"
        ;;
    *)
        echo "Opción no válida"
        ;;
esac

