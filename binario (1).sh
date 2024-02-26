#!/bin/bash

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
    read -p "Introduce tu número binario: " binario
    octal=''
    # Un case para verificar si el usuario pone 0 y 1, sinó error    
    case $binario in
        *[!01]*)
            echo "Error, introduce solo número binarios (0/1)"
            acabadoB=false
            ;;
        *)
            # En caso de que sea 0 y/o 1 no pasará nada y continuará con el codigo
            ;;
    esac
    # Calcula la longitud del binario que introducimos
    len=${#binario}

    # Completar con ceros a la izquierda si es necesario para formar grupos de tres dígitos
    while [ $(($len % 3)) -ne 0 ]; do
        binario="0$binario"
        len=${#binario}
    done

    # Iterar a través de los dígitos binarios desde la izquierda, en grupos de tres
    for (( i = 0; i < ${#binario}; i+=3 )); do
        # Variable que extrae en grupos de tres dígitos binarios
        chunk=${binario:i:3}
        
        # Utilizar un case para convertir el grupo de tres dígitos a octal
        case $chunk in
            000) octal+="0" ;;
            001) octal+="1" ;;
            010) octal+="2" ;;
            011) octal+="3" ;;
            100) octal+="4" ;;
            101) octal+="5" ;;
            110) octal+="6" ;;
            111) octal+="7" ;;
        esac
    done

    echo $octal
}

# Función conversor Binario a hexadecimal
binario_a_hexadecimal() {
    read -p "Introduce tu número binario: " binario
    hexadecimal=''
    # Un case para verificar si el usuario pone 0 y 1, sinó error
    case $binario in
        *[!01]*)
            echo "Error, introduce solo números binarios (0/1)"
            acabadoB=false
            ;;
        *)
            # En caso de que sea 0 y/o 1 no pasará nada y continuará con el codigo
            ;;
    esac

    # Calcular la longitud del número binario
    len=${#binario}

    # While que completará con ceros a la izquierda si es necesario para formar grupos de cuatro dígitos
    while [ $(($len % 4)) -ne 0 ]; do
        binario="0$binario"
        len=${#binario}
    done

    # Iterar a través de los dígitos binarios desde la izquierda, en grupos de cuatro
    for (( i = 0; i < ${#binario}; i+=4 )); do
        # Variable que extrae en grupos de cuatro dígitos binarios
        chunk=${binario:i:4}
        
        # Uso de case para convertir el grupo de cuatro dígitos a hexadecimal
        case $chunk in
            0000) hexadecimal+="0" ;;
            0001) hexadecimal+="1" ;;
            0010) hexadecimal+="2" ;;
            0011) hexadecimal+="3" ;;
            0100) hexadecimal+="4" ;;
            0101) hexadecimal+="5" ;;
            0110) hexadecimal+="6" ;;
            0111) hexadecimal+="7" ;;
            1000) hexadecimal+="8" ;;
            1001) hexadecimal+="9" ;;
            1010) hexadecimal+="A" ;;
            1011) hexadecimal+="B" ;;
            1100) hexadecimal+="C" ;;
            1101) hexadecimal+="D" ;;
            1110) hexadecimal+="E" ;;
            1111) hexadecimal+="F" ;;
        esac
    done

    echo $hexadecimal
}

# Función conversor Binario a decimal
binario_a_decimal() {
    read -p "Introduce tu número binario: " binario
    # Un case para verificar si el usuario pone 0 y 1, sinó error    
    case $binario in
        *[!01]*)
            echo "Error, introduce solo números binarios (0/1)"
            acabadoB=false
            ;;
        *)
            # En caso de que sea 0 y/o 1 no pasará nada y continuará con el codigo
            ;;
    esac
    decimal=0
    i=0
        # Convertimos el binario a entero
    while [ $binario -gt 0 ];
    do
        digito=$((binario % 10))
        decimal=$((decimal + digito * 2**i))
        i=$((i + 1))
        binario=$((binario / 10))
    done
    echo $decimal
    decimal=""
}

#Funcion que pregunta para volver al Menu
function de_nuevoB(){
    read -p "Quieres volver al Menú Principal? (S/N): " volver
    case $volver in
        s|S)
            clear 
            Menu_Principal
            ;;
        n|N)
            clear
            echo "Adiós!"
            acabadoB=false
            ;;
        *)
            echo "Opcion no valida, vuelve a introducir tu respuesta"
            acabadoB=false
            ;;
    esac
}

#Function MenuPrincipal
function Menu_Principal(){
echo " ________________________________ "
echo "|         Conversor              |"
echo "|                                |"
echo "|   1. Binario a Decimal         |"
echo "|   2. Binario a Octal           |"
echo "|   3. Binario a Hexadecimal     |"
echo "|   4. Salir                     |"
echo "|________________________________|"
# Read para hacer elegir al usuario que conversión hacer
read -p "Elige qué tipo de conversor deseas: " convopt

}

#Para empezar la funcion de Menu_Principal
Menu_Principal

#While para las respuestas de los conversores
#Variable acabadoB para empezar y terminar el bucle
acabadoB=true
while [ $acabadoB == true ];
do
    case $convopt in
        1)
            respuesta_decimal=$(binario_a_decimal)
            echo "El número decimal es: $respuesta_decimal"
            registro "binario decimal" "$convopt" "$decimal"
            # Llamada a la función de_nuevoB al mostrar los resultados
            de_nuevoB
            ;;
        2)
            respuesta_octal=$(binario_a_octal)
            echo "El número octal es: $respuesta_octal"
            registro "binario decimal" "$convopt" "$octal"
            # Llamada a la función de_nuevoB al mostrar los resultados
            de_nuevoB
            ;;
        3)
            respuesta_hexadecimal=$(binario_a_hexadecimal)
            echo "El número hexadecimal es: $respuesta_hexadecimal"
            registro "binario decimal" "$convopt" "$hexadecimal"
            # Llamada a la función de_nuevoB al mostrar los resultados 
            de_nuevoB
            ;;
        4)
            echo "Hasta luego!"
            acabadoB=false
            ;;
        *)
            clear
            echo "Opción no válida"
            acabadoB=false
            ;;
    esac

done