#!/bin/bash
function menu() {
    echo " __________________________"
    echo "|                          |"
    echo "| 1) Hexadecimal a decimal |"
    echo "| 2) Hexadecimal a binario |"
    echo "| 3) Hexadecimal a octal   |"
    echo "| 4) Volver atras          |"
    echo "|__________________________|"
    read -p "Opcion: " opcion

    case $opcion in 
        1)
            menu_anterior=1
            hexadecimal_decimal ;;
        2)
            menu_anterior=2
            hexadecimal_binario ;;
        3)
            menu_anterior=3
            hexadecimal_octal ;;
        4)
            bash menu.sh
    esac
}
function verificacion(){
while true;
do
    read -p  "Numero Hexadecimal: " hexadecimal 
    if [[ $hexadecimal =~ ^[0-9a-fA-F]+$ ]];
        then 
            break
    else
        echo "Numero octal invalido"
        sleep 2
        clear
        echo "Introduzca un numero valido"
        echo
    fi
done
}
function volver_a_usar(){
while true; 
do
    read -n1 -p "Presione 'm' para volver al menu o 'n' para volver a usar la conversion: " opcion
    case $opcion in 
        m)
            clear
            menu ;;
        n)
            clear
            case $menu_anterior in
                1)
                    hexadecimal_decimal ;;
                2)
                    hexadecimal_binario ;;
                3)
                    hexadecimal_octal 
            esac ;;
        *)
            echo
            echo "Opcion invalida"
            sleep 2
            clear 
    esac
done
}
function registro(){
    local tipo_conversion=$1
    local numero_hexadecimal=$2
    local resultado=$3
    local fecha=$( date +"%d/%m/%Y" )
    if [ $numero_hexadecimal != "" ]
    then
    echo "$fecha $tipo_conversion $numero_hexadecimal $resultado" >> registro.txt
    fi
}
function hexadecimal_decimal(){
    clear
    verificacion
    opcion="hexadecimal decimal"
    local longitud=${#hexadecimal}
    local decimal=0
    local valor=0
    local numero=""

        for ((i=0; i<$longitud; i++))
        do
        numero=${hexadecimal:$((longitud-i-1)):1}
        case $numero in
        [0-9])
            valor=$((numero)) ;;
        [aA])
            valor=10 ;;
        [bB])
            valor=11 ;;
        [cC])
            valor=12 ;;
        [dD])
            valor=13 ;;
        [eE])
            valor=14 ;;
        [fF])
            valor=15 ;;
        esac
        decimal=$(($decimal + valor * 16**$i))
        done
    echo     
    echo     "Numero Decimal: $decimal"
    echo
    registro "$opcion" "$hexadecimal" "$decimal"
    volver_a_usar
}
function hexadecimal_binario(){
    clear
    verificacion
    local opcion="hexadecimal binario"
    local longitud=${#hexadecimal}
    local binario=""
        for ((i=0; i<$longitud; i++))
        do
        case ${hexadecimal:$i:1} in
            0) binario+="0000";;
            1) binario+="0001";;
            2) binario+="0010";;
            3) binario+="0011";;
            4) binario+="0100";;
            5) binario+="0101";;
            6) binario+="0110";;
            7) binario+="0111";;
            8) binario+="1000";;
            9) binario+="1001";;
            [aA]) binario+="1010";;
            [bB]) binario+="1011";;
            [cC]) binario+="1100";;
            [dD]) binario+="1101";;
            [eE]) binario+="1110";;
            [fF]) binario+="1111";;
        esac
        done
    echo     
    echo     "Numero Binario: $binario"
    echo
    registro "$opcion" "$hexadecimal" "$binario"
    volver_a_usar

}
function hexadecimal_octal(){
    clear
    verificacion
    local opcion="octal hexadecimal"
    local longitud=${#hexadecimal}
    local binario=""
        for ((i=0; i<$longitud; i++))
        do
        case ${hexadecimal:$i:1} in
            0) binario+="0000";;
            1) binario+="0001";;
            2) binario+="0010";;
            3) binario+="0011";;
            4) binario+="0100";;
            5) binario+="0101";;
            6) binario+="0110";;
            7) binario+="0111";;
            8) binario+="1000";;
            9) binario+="1001";;
            [aA]) binario+="1010";;
            [bB]) binario+="1011";;
            [cC]) binario+="1100";;
            [dD]) binario+="1101";;
            [eE]) binario+="1110";;
            [fF]) binario+="1111";;
        esac
        done
    echo     
    
    local longitud_2=${#binario}
    while (( $longitud_2 % 3 != 0 ));
    do
        binario="0$binario"
        longitud_2=${#binario}
    done

    local octal=""
    local inicio=0
    while [ $inicio -lt $longitud_2 ];
    do
    numero=${binario:$inicio:3}
        case $numero in
            "000") octal+="0" ;;
            "001") octal+="1" ;;
            "010") octal+="2" ;;
            "011") octal+="3" ;;
            "100") octal+="4" ;;
            "101") octal+="5" ;;
            "110") octal+="6" ;;
            "111") octal+="7" ;;
        esac
        inicio=$((inicio + 3))
    done
    echo
    echo "Numero Octal: $octal"
    echo
    registro "$opcion" "$hexadecimal" "$octal"
    volver_a_usar
}
menu