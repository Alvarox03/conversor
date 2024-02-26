#!/bin/bash

# Registro
function registro(){
    local tipo_conversion=$1
    local numero_hexadecimal=$2
    local resultado=$3
    local fecha=$(date +"%d/%m/%Y")
    if [ "$numero_hexadecimal" != "" ]; then
        echo "$fecha $tipo_conversion $numero_hexadecimal $resultado" >> registro.txt
    fi
}

# Función conversor decimal a binario
decimal_a_binario() {
    read -p "Introduzca su número decimal: " decimal
    binario=""
    while [ $decimal -gt 0 ]; do
        resto=$((decimal % 2))
        binario="$resto$binario"
        decimal=$((decimal / 2))
    done
    registro "decimal binario" "$convopt" "$binario"
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
    registro "decimal octal" "$convopt" "$octal"
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
    registro "decimal hexadecimal" "$convopt" "$hexadecimal"
    echo $hexadecimal
}

#funcion para preguntar de nuevo y regresar al menu principal
function acabarDN(){
    read -p "¿Quieres volver al Menú Principal? (S/N): " volver
    case $volver in
        s|S)
            clear
            Menu_Principal
            ;;
        n|N)
            clear
            echo "Adiós!"
            acabadoD=false
            ;;
        *)
            echo "Opción no válida, Adios"
            acabadoD=false
            ;;
    esac
}

#Function MenuPrincipal
function Menu_Principal(){
echo " ________________________________"
echo "|         Conversor              |"
echo "|                                |"
echo "|   1. Decimal a Binario         |"
echo "|   2. Decimal a Octal           |"
echo "|   3. Decimal a Hexadecimal     |"
echo "|   4. Salir                     |"
echo "|                                |"
echo "|________________________________|"
# Read para hacer elegir al usuario que conversión hacer
read -p "Eliga qué tipo de conversor desea: " convopt
}

#Para empezar la funcion de Menu_Principal
Menu_Principal

#While para las respuestas de los conversores
#Variable acabadoD para empezar y terminar el bucle
acabadoD=true
while [ $acabadoD == true ]; 
do

    case $convopt in
        1)
            respuesta_binario=$(decimal_a_binario)
            echo "El número binario es: $respuesta_binario"
            acabarDN
            ;;
        2)
            respuesta_octal=$(decimal_a_octal)
            echo "El número octal es: $respuesta_octal"
            acabarDN
            ;;
        3)
            respuesta_hexadecimal=$(decimal_a_hexadecimal)
            echo "El número hexadecimal es: $respuesta_hexadecimal"
            acabarDN
            ;;
        4)
            echo "Hasta luego!"
            acabadoD=false
            ;;
        *)
            clear
            echo "Opción no válida"
            acabadoD=false
            ;;
    esac
done