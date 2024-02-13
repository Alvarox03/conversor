#!/bin/bash


function menu() {
    echo " ________________________"
    echo "|                        |"
    echo "| 1) Octal a decimal     |"
    echo "| 2) Octal a binario     |"
    echo "| 3) Octal a hexadecimal |"
    echo "| 4) Volver atras        |"
    echo "|________________________|"
    read -p "Opcion: " opcion

    case $opcion in 
        1)
            menu_anterior=1
            octal_decimal ;;
        2)
            menu_anterior=2
            octal_binario ;;
        3)
            menu_anterior=3
            octal_hexadecimal ;;
        4)
            bash menu.sh
    esac
}
function verificacion(){

while true;
do
    read -p  "Numero Octal: " octal 
    if [[ $octal =~ ^[0-7]+$ ]];
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
                    octal_decimal ;;
                2)
                    octal_binario ;;
                3)
                    octal_hexadecimal 
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
    local numero_octal=$2
    local resultado=$3
    local fecha=$( date +"%d/%m/%Y" )
    if [ $numero_octal != "" ]
    then
    echo "$fecha $tipo_conversion $numero_octal $resultado" >> registro.txt
    fi
}
function octal_decimal(){
    clear
    verificacion
    local opcion="octal decimal"
    local longitud=${#octal}
    local decimal=0
        for ((i=0; i<$longitud; i++))
        do
        numero=${octal:$((longitud-i-1)):1}
        decimal=$(($decimal + $((numero)) * 8**$i))
        done
    echo     
    echo     "Numero Decimal: $decimal"
    echo
    registro "$opcion" "$octal" "$decimal"
    volver_a_usar
}
function octal_binario(){
    clear
    verificacion
    local opcion="octal binario"
    local longitud=${#octal}
    local binario=""
        for ((i=0; i<$longitud; i++))
        do
        case ${octal:$i:1} in
            0) binario+="000";;
            1) binario+="001";;
            2) binario+="010";;
            3) binario+="011";;
            4) binario+="100";;
            5) binario+="101";;
            6) binario+="110";;
            7) binario+="111";;
        esac
        done
    echo     
    echo     "Numero Binario: $binario"
    echo
    registro "$opcion" "$octal" "$binario"
    volver_a_usar

}
function octal_hexadecimal(){
    clear
    verificacion
    local opcion="octal hexadecimal"
    local longitud=${#octal}
    local binario=""
        for ((i=0; i<$longitud; i++))
        do
        case ${octal:$i:1} in
            0) binario+="000";;
            1) binario+="001";;
            2) binario+="010";;
            3) binario+="011";;
            4) binario+="100";;
            5) binario+="101";;
            6) binario+="110";;
            7) binario+="111";;
        esac
        done
    
    local longitud_2=${#binario}
    while (( $longitud_2 % 4 != 0 ));
    do
        binario="0$binario"
        longitud_2=${#binario}
    done

    local hexadecimal=""
    local inicio=0
    while [ $inicio -lt $longitud_2 ];
    do
    numero=${binario:$inicio:4}
        case $numero in
            "0000") hexadecimal+="0" ;;
            "0001") hexadecimal+="1" ;;
            "0010") hexadecimal+="2" ;;
            "0011") hexadecimal+="3" ;;
            "0100") hexadecimal+="4" ;;
            "0101") hexadecimal+="5" ;;
            "0110") hexadecimal+="6" ;;
            "0111") hexadecimal+="7" ;;
            "1000") hexadecimal+="8" ;;
            "1001") hexadecimal+="9" ;;
            "1010") hexadecimal+="A" ;;
            "1011") hexadecimal+="B" ;;
            "1100") hexadecimal+="C" ;;
            "1101") hexadecimal+="D" ;;
            "1110") hexadecimal+="E" ;;
            "1111") hexadecimal+="F" ;;
        esac
        inicio=$((inicio + 4))
    done
    echo
    echo "Numero Hexadecimal: $hexadecimal"
    echo
    registro "$opcion" "$octal" "$hexadecimal"
    volver_a_usar
}
menu