#!/bin/bash
#Menú de gráfica
function menuGraf {
    echo " ----------------------------- "
    echo "|  1. Ver gráfica de uso      |"
    echo "|  2. Valores predeterminados |"
    echo "|  3. Cambiar valor de '*'    |"
    echo "|  4. Salir                   |"
    echo " ----------------------------- "
}
#Generador del gráfico
function grafico {
    tipo=$1

    awk -v tipo="$tipo" '$2 == tipo' registro.txt | wc -l > temporal.txt
    cantidad=$(cat temporal.txt)

    #Cantidad tiene que ser > 0
    if [ $cantidad -gt 0 ]; then
        #Cantidad de * que poner
        asteriscos=$((cantidad / valor))
        #Cantidad de . que poner
        restantes=$((cantidad % valor))

        i=1
        j=1

        while [ $i -le $asteriscos ]
        do
            echo -n "*"
            i=$((i + 1))
        done

        while [ $j -le $restantes ]
        do
            echo -n "."
            j=$((j + 1))
        done
        echo
    fi

    rm temporal.txt
}
#Valores de la gráfica
function leyenda {
    echo "           VALORES"
    echo "  * = elección del usuario"
    echo "  * actual = $valor"
    echo "  . = 1"
}

#Empieza el código
#Cantidad de registros
registros=$(cat registro.txt | wc -l)
registros=$((registros + 1))

#Registros de cada tipo
registros_decimales=$(awk '$2 == "decimal"' registro.txt | wc -l)
registros_binarios=$(awk '$2 == "binario"' registro.txt | wc -l)
registros_octales=$(awk '$2 == "octal"' registro.txt | wc -l)
registros_hexadecimales=$(awk '$2 == "hexadecimal"' registro.txt | wc -l)

clear
menuGraf
echo "Hay $registros registros"
#Usuario asigna el valor a *
read -p "Ingresa la cantidad de registros que representa un asterisco en el gráfico: " valor

correct=true
while [ $correct == true ]
do
    read -p "Elija una opción: " option
    case $option in
        1)
            clear
            #Ejecuta la grafica para cada tipo
            echo "Dec: $(grafico 'decimal') $registros_decimales"
            echo "Bin: $(grafico 'binario') $registros_binarios"
            echo "Oct: $(grafico 'octal') $registros_octales"
            echo "Hex: $(grafico 'hexadecimal') $registros_hexadecimales"
            read -p "Presiona 'Enter' para volver al menú" enter
            clear
            menuGraf
            ;;
        2)
            clear
            leyenda
            read -p "Presiona 'Enter' para volver al menú" enter
            clear
            menuGraf
            ;;
        3)  
            clear
            read -p "Ingresa la cantidad de registros que representa un asterisco en el gráfico: " valor
            clear
            menuGraf
            ;;
        4)
            correct=false
            ;;
        *)
            echo "Elija una opción válida"
    esac
done