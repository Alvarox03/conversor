#!/bin/bash

# Verificar si el archivo "registro.txt" existe
if [ ! -f "registro.txt" ]; then 
    echo "Error: El archivo 'registro.txt' no ha sido encontrado."
    exit 1
fi
# Definición de funciones
Decimal() {
    while true; do
        echo " - - - - - - - - - - - - - - - - - - - - - - - - - - "
        echo " - ¿Qué deseas hacer con la conversion en Decimal? - "
        echo " - 1. Todas las conversiones en Decimal            - "
        echo " - 2. Que tipo de conversion de Decimal            - "
        echo " - 3. Salir                                        - "
        echo " - - - - - - - - - - - - - - - - - - - - - - - - - - "
        read opcion_convers
        case $opcion_convers in
            1)
                resultado=$(awk '$2 == "decimal"' "registro.txt")
                recuento=$(echo "$resultado" | wc -l)
                echo "Resultado final:"
                echo "$recuento"
                echo "$resultado"
                ;;
            2)
                echo "Introduce (binario),(octal),(hexadecimal)"
                read palabra
                if [ "$palabra" = "binario" ]; then
                    resultado=$(awk '$2 == "decimal" && $3 == "binario"' registro.txt)
                elif [ "$palabra" = "octal" ]; then 
                    resultado=$(awk '$2 == "decimal" && $3 == "octal"' registro.txt)
                elif [ "$palabra" = "hexadecimal" ]; then 
                    resultado=$(awk '$2 == "decimal" && $3 == "hexadecimal"' registro.txt)
                fi
                if [ -z "$resultado" ];
                then
                    echo "No hay $palabra en el base de datos"
                else
                recuento=$( echo "$resultado" | wc -l) #wc -l cada vez que imprime va contando
                echo "Resultado final:"
                echo "$recuento"
                echo "$resultado"
                
                fi
                ;;
            3)  
                return
                ;;
            *)
                echo "Opción no válida"
                ;;
        esac
        echo "Presiona Enter para volver al menú"
        read enter
        clear
    done
}
Binario() {
    while true; do
        echo " - - - - - - - - - - - - - - - - - - - - - - - - - - "
        echo " - ¿Qué deseas hacer con la conversion en Binario? - "
        echo " - 1. Todas las conversiones en Binario            - "
        echo " - 2. Que tipo de conversion de Binario            - "
        echo " - 3. Salir                                        - "
        echo " - - - - - - - - - - - - - - - - - - - - - - - - - - "
        read opcion_convers
        case $opcion_convers in
            1)
                resultado=$(awk '$2 == "binario"' "registro.txt")
                recuento=$(echo "$resultado" | wc -l)
                echo "Resultado final:"
                echo "$recuento"
                echo "$resultado"
                ;;
            2)
                echo "Introduce (decimal),(octal),(hexadecimal)"
                read palabra
                if [ "$palabra" = "decimal" ]; then
                    resultado=$(awk '$2 == "binario" && $3 == "decimal"' registro.txt)
                elif [ "$palabra" = "octal" ]; then 
                    resultado=$(awk '$2 == "binario" && $3 == "octal"' registro.txt)
                elif [ "$palabra" = "hexadecimal" ]; then 
                    resultado=$(awk '$2 == "binario" && $3 == "hexadecimal"' registro.txt)
                fi
                if [ -z "$resultado" ];
                then
                    echo "No hay $palabra en el base de datos"
                else
                recuento=$( echo "$resultado" | wc -l) #wc -l cada vez que imprime va contando
                echo "Resultado final:"
                echo "$recuento"
                echo "$resultado"
                
                fi
                ;;
            3)  
                return
                ;;
            *)
                echo "Opción no válida"
                ;;
        esac
        echo "Presiona Enter para volver al menú"
        read enter
        clear
    done
}
Octal() {
   while true; do
        echo " - - - - - - - - - - - - - - - - - - - - - - - - - - "
        echo " - ¿Qué deseas hacer con la conversion en Octal?   - "
        echo " - 1. Todas las conversiones en Octal              - "
        echo " - 2. Que tipo de conversion de Octal              - "
        echo " - 3. Salir                                        - "
        echo " - - - - - - - - - - - - - - - - - - - - - - - - - - "
        read opcion_convers
        case $opcion_convers in
            1)
                resultado=$(awk '$2 == "octal"' "registro.txt")
                recuento=$(echo "$resultado" | wc -l)
                echo "Resultado final:"
                echo "$recuento"
                echo "$resultado"
                ;;
            2)
                echo "Introduce (decimal),(binario),(hexadecimal)"
                read palabra
                if [ "$palabra" = "decimal" ]; then
                    resultado=$(awk '$2 == "octal" && $3 == "decimal"' registro.txt)
                elif [ "$palabra" = "binario" ]; then 
                    resultado=$(awk '$2 == "octal" && $3 == "binario"' registro.txt)
                elif [ "$palabra" = "hexadecimal" ]; then 
                    resultado=$(awk '$2 == "octal" && $3 == "hexadecimal"' registro.txt)
                fi
                if [ -z "$resultado" ];
                then
                    echo "No hay $palabra en el base de datos"
                else
                recuento=$( echo "$resultado" | wc -l) #wc -l cada vez que imprime va contando
                echo "Resultado final:"
                echo "$recuento"
                echo "$resultado"
                
                fi
                ;;
            3)  
                return
                ;;
            *)
                echo "Opción no válida"
                ;;
        esac
        echo "Presiona Enter para volver al menú"
        read enter
        clear
    done  
}

Hexadecimal() {
     while true; do
        echo " - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
        echo " - ¿Qué deseas hacer con la conversion en Hexadecimal? - "
        echo " - 1. Todas las conversiones en Hexadecimal            - "
        echo " - 2. Que tipo de conversion de Hexadecimal            - "
        echo " - 3. Salir                                            - "
        echo " - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
        read opcion_convers
        case $opcion_convers in
            1)
                resultado=$(awk '$2 == "hexadecimal"' "registro.txt")
                recuento=$(echo "$resultado" | wc -l)
                echo "Resultado final:"
                echo "$recuento"
                echo "$resultado"
                ;;
            2)
                echo "Introduce (decimal),(binario),(octal)"
                read palabra
                if [ "$palabra" = "decimal" ]; then
                    resultado=$(awk '$2 == "hexadecimal" && $3 == "decimal"' registro.txt)
                elif [ "$palabra" = "binario" ]; then 
                    resultado=$(awk '$2 == "hexadecimal" && $3 == "binario"' registro.txt)
                elif [ "$palabra" = "octal" ]; then 
                    resultado=$(awk '$2 == "hexadecimal" && $3 == "octal"' registro.txt)
                fi
                if [ -z "$resultado" ];
                then
                    echo "No hay $palabra en el base de datos"
                else
                recuento=$( echo "$resultado" | wc -l) #wc -l cada vez que imprime va contando
                echo "Resultado final:"
                echo "$recuento"
                echo "$resultado"
                fi
                ;;
            3)  
                return
                ;;
            *)
                echo "Opción no válida"
                ;;
        esac
        echo "Presiona Enter para volver al menú"
        read enter
        clear
    done   
}

#Grafico
function genera_asterisco {
    i=1
    cantidad=$1
    while [ $i -le $cantidad ]
    do
        if [ $i -eq $cantidad ]
        then
            echo "*"
        else
            echo -n "*"
        fi
        i=$((i + 1)) 
    done
}

function grafico {
    tipo=$1
    awk -v tipo="$tipo" '$2 == tipo' registro.txt >> temporal.txt
    cantidad=$(wc -l < temporal.txt)
    if [ $cantidad -gt 0 ] 
    then
        genera_asterisco $cantidad
    fi
    rm temporal.txt
}

# Inicio del script
echo "Bienvenido a tu Registro"

# Menú de opciones
while true;
do 
    echo " - - - - - - - - - - - - - - - - - - - - - - - - - "
    echo " - ¿Bienvenido qué acción quieres realizar?      - "
    echo " - 1. Decimal                                    - "
    echo " - 2. Binario                                    - "
    echo " - 3. Octal                                      - "
    echo " - 4. Hexadecimal                                - "
    echo " - 5. Grafica de uso                             - "
    echo " - 6. Salir                                      - "
    echo " - - - - - - - - - - - - - - - - - - - - - - - - - "
    read opcion

    case $opcion in
        1) 
            Decimal
            ;;
        2)
            Binario
            ;;
        3)
            Octal
            ;;
        4)
            Hexadecimal
            ;;
        5)
            echo "Dec: $(grafico 'decimal')"
            echo "Bin: $(grafico 'binario')"
            echo "Oct: $(grafico 'octal')"
            echo "Hex: $(grafico 'hexadecimal')"
            ;;
        6) 
            echo "Salir"
            exit 0
            ;;
        *)
            echo "Opción no válida"
            ;;
    esac
    echo "Presiona Enter para volver al menú"
    read enter
    clear
done
