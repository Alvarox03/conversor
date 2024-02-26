#!/bin/bash
# Definición de funciones
Decimal() { 
    Salir=true
    while [ $Salir == true ]; do
        echo " - - - - - - - - - - - - - - - - - - - - - - - - - - "
        echo " - ¿Qué deseas hacer con la conversion en Decimal? - "
        echo " - 1. Todas las conversiones en Decimal            - "
        echo " - 2. Que tipo de conversion de Decimal            - "
        echo " - 3. Fecha de ordenadas                           - "
        echo " - 4. Fecha especifica                             - "
        echo " - 5. Exportar                                     - "       
        echo " - 6. Salir                                        - "
        echo " - - - - - - - - - - - - - - - - - - - - - - - - - - "
        read opcion_convers

        case $opcion_convers in
            1)
                resultado=$(awk '$2 == "decimal"' "registro.txt")
                recuento=$(echo "$resultado" | wc -l)
                echo "Resultado final:"
                echo "$recuento"
                echo "$resultado"
                echo "Presiona Enter para volver al menú"
                read enter
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
                if [ -z "$resultado" ]; then
                    echo "No hay $palabra en la base de datos"
                    echo "Presiona Enter para volver al menú"
                    read enter
                else
                    recuento=$(echo "$resultado" | wc -l)
                    echo "Resultado final:"
                    echo "$recuento"
                    echo "$resultado"
                    echo "Presiona Enter para volver al menú"
                    read enter
                fi
                ;;
            3)  
                echo "¿Quiere ver lo Nuevo o Antiguo?"
                read fecha

                if [ "$fecha" = "Nuevo" ]; then
                    resultado=$(sort -t '/' -k3,3n -k2,2n -k1,1n registro.txt | awk '$2 == "decimal"')
                elif [ "$fecha" = "Antiguo" ]; then
                    resultado=$(sort -t '/' -k3,3nr -k2,2nr -k1,1nr registro.txt | awk '$2 == "decimal"')
                 
                fi

                echo "$resultado"
                echo "Presiona Enter para volver al menú"
                read enter
                ;;
            4)  
                echo "Introduce la fecha que quieres buscar: [dd/mm/aaaa]"
                read fecha
                if [[ $fecha =~ ^[0-9]{2}/[0-9]{2}/[0-9]{4}$ ]]; then
                    echo "Formato de fecha correcto."
                else
                    echo "Formato de fecha incorrecto. Debe ser [dd/mm/aaaa]."
                    salir=false
                fi
                
                resultado=$(grep "$fecha" registro.txt | awk '$2 == "decimal"')

                if [ -z "$resultado" ]; then
                    echo "No se encontraron registros para la fecha $fecha."
                else
                    echo "Resultados encontrados para la fecha $fecha:"
                    echo "$resultado"
                fi
                echo "Presiona Enter para volver al menú"
                read enter
                ;;
            5)  
                echo "Introduce la fecha que quieres buscar: [dd/mm/aaaa]"
                read fecha
                echo "Introduce el nombre del fichero sin extension"
                read carpeta

                if [[ $fecha =~ ^[0-9]{2}/[0-9]{2}/[0-9]{4}$ ]]; then
                    echo "Formato de fecha correcto."
                else
                    echo "Formato de fecha incorrecto. Debe ser [dd/mm/aaaa]."
                    salir=false
                fi

                resultado=$(grep "$fecha" registro.txt | awk '$2 == "decimal"')

                if [ -z "$resultado" ]; then
                    echo "No se encontraron registros para la fecha $fecha."
                else
                    echo "Resultados encontrados para la fecha $fecha:"
                    echo "$resultado" > "./$carpeta.txt"
                    echo "El archivo ha sido exportado."
                fi

                echo "Presiona Enter para volver al menú"
                read enter
                ;;
            6)  
                Salir=false
                ;;
            *)
                echo "Opción no válida"
                ;;
        esac
        clear
    done
}
Binario() {
    Salir2=true
    while [ $Salir2 == true ]; do
        echo " - - - - - - - - - - - - - - - - - - - - - - - - - - "
        echo " - ¿Qué deseas hacer con la conversion en Binario? - "
        echo " - 1. Todas las conversiones en Binario            - "
        echo " - 2. Que tipo de conversion de Binario            - "
        echo " - 3. Fecha de ordenadas                           - "
        echo " - 4. Fecha especifica                             - "
        echo " - 5. Exportar                                     - "
        echo " - 6. Salir                                        - "
        echo " - - - - - - - - - - - - - - - - - - - - - - - - - - "
        read opcion_convers
        case $opcion_convers in
            1)
                resultado=$(awk '$2 == "binario"' "registro.txt")
                recuento=$(echo "$resultado" | wc -l)
                echo "Resultado final:"
                echo "$recuento"
                echo "$resultado"
                echo "Presiona Enter para volver al menú"
                read enter
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
                    echo "Presiona Enter para volver al menú"
                    read enter
                else
                recuento=$( echo "$resultado" | wc -l) #wc -l cada vez que imprime va contando
                echo "Resultado final:"
                echo "$recuento"
                echo "$resultado"
                echo "Presiona Enter para volver al menú"
                read enter
                fi
                ;;
            3)  
                echo "¿Quiere ver lo Nuevo o Antiguo?"
                read fecha

                if [ "$fecha" = "Nuevo" ]; then
                    resultado=$(sort -t '/' -k3,3n -k2,2n -k1,1n registro.txt | awk '$2 == "binario"')
                elif [ "$fecha" = "Antiguo" ]; then
                    resultado=$(sort
                     -t '/' -k3,3nr -k2,2nr -k1,1nr registro.txt | awk '$2 == "binario"')
                 
                fi

                echo "$resultado"
                echo "Presiona Enter para volver al menú"
                read enter
                ;;
            4)  
                echo "Introduce la fecha que quieres buscar: [dd/mm/aaaa]"
                read fecha

                if [[ $fecha =~ ^[0-9]{2}/[0-9]{2}/[0-9]{4}$ ]]; then
                    echo "Formato de fecha correcto."
                else
                    echo "Formato de fecha incorrecto. Debe ser [dd/mm/aaaa]."
                    Salir2=false
                fi

                resultado=$(grep "$fecha" registro.txt | awk '$2 == "binario"')

                if [ -z "$resultado" ]; then
                    echo "No se encontraron registros para la fecha $fecha con segundo parámetro binario."
                else
                    echo "Resultados encontrados para la fecha $fecha con segundo parámetro binario:"
                    echo "$resultado"
                fi

                echo "Presiona Enter para volver al menú"
                read enter
                ;;
             5)  
                echo "Introduce la fecha que quieres buscar: [dd/mm/aaaa]"
                read fecha
                echo "Introduce el nombre del fichero sin extension"
                read carpeta

                if [[ $fecha =~ ^[0-9]{2}/[0-9]{2}/[0-9]{4}$ ]]; then
                    echo "Formato de fecha correcto."
                else
                    echo "Formato de fecha incorrecto. Debe ser [dd/mm/aaaa]."
                    Salir2=false
                fi

                resultado=$(grep "$fecha" registro.txt | awk '$2 == "binario"')

                if [ -z "$resultado" ]; then
                    echo "No se encontraron registros para la fecha $fecha."
                else
                    echo "Resultados encontrados para la fecha $fecha:"
                    echo "$resultado" > "./$carpeta.txt"
                    echo "El archivo ha sido exportado."
                fi

                echo "Presiona Enter para volver al menú"
                read enter
                ;;
            6)  
                Salir2=false
                ;;
            *)
                echo "Opción no válida"
                ;;
        esac
        clear
    done
}

Octal() {
    Salir3=true
   while [ $Salir3 == true ]; do
        echo " - - - - - - - - - - - - - - - - - - - - - - - - - - "
        echo " - ¿Qué deseas hacer con la conversion en Octal?   - "
        echo " - 1. Todas las conversiones en Octal              - "
        echo " - 2. Que tipo de conversion de Octal              - "
        echo " - 3. Fecha de ordenadas                           - "
        echo " - 4. Fecha especifica                             - "
        echo " - 5. Exportar                                     - "
        echo " - 6. Salir                                        - "
        echo " - - - - - - - - - - - - - - - - - - - - - - - - - - "
        read opcion_convers
        case $opcion_convers in
            1)
                resultado=$(awk '$2 == "octal"' "registro.txt")
                recuento=$(echo "$resultado" | wc -l)
                echo "Resultado final:"
                echo "$recuento"
                echo "$resultado"
                echo "Presiona Enter para volver al menú"
                read enter
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
                    echo "Presiona Enter para volver al menú"
                    read enter
                else
                recuento=$( echo "$resultado" | wc -l) #wc -l cada vez que imprime va contando
                echo "Resultado final:"
                echo "$recuento"
                echo "$resultado"
                echo "Presiona Enter para volver al menú"
                read enter
                fi
                ;;
            3)  
                echo "Quiere ver lo Nuevo o Antiguo"
                echo "¿Quiere ver lo Nuevo o Antiguo?"
                read fecha

                if [ "$fecha" = "Nuevo" ]; then
                    resultado=$(sort -t '/' -k3,3n -k2,2n -k1,1n registro.txt | awk '$2 == "octal"')
                elif [ "$fecha" = "Antiguo" ]; then
                    resultado=$(sort
                     -t '/' -k3,3nr -k2,2nr -k1,1nr registro.txt | awk '$2 == "octal"')
                 
                fi

                echo "$resultado"
                echo "Presiona Enter para volver al menú"
                read enter
                ;;
            4)  
                echo "Introduce la fecha que quieres buscar: [dd/mm/aaaa]"
                read fecha
                if [[ $fecha =~ ^[0-9]{2}/[0-9]{2}/[0-9]{4}$ ]]; then
                    echo "Formato de fecha correcto."
                else
                    echo "Formato de fecha incorrecto. Debe ser [dd/mm/aaaa]."
                    Salir3=false
                fi
                
                resultado=$(grep "$fecha" registro.txt | awk '$2 == "octal"')

                if [ -z "$resultado" ]; then
                    echo "No se encontraron registros para la fecha $fecha."
                else
                    echo "Resultados encontrados para la fecha $fecha:"
                    echo "$resultado"
                fi
                echo "Presiona Enter para volver al menú"
                read enter
                ;;
             5)  
                echo "Introduce la fecha que quieres buscar: [dd/mm/aaaa]"
                read fecha
                echo "Introduce el nombre del fichero sin extension"
                read carpeta

                if [[ $fecha =~ ^[0-9]{2}/[0-9]{2}/[0-9]{4}$ ]]; then
                    echo "Formato de fecha correcto."
                else
                    echo "Formato de fecha incorrecto. Debe ser [dd/mm/aaaa]."
                    Salir3=false
                fi

                resultado=$(grep "$fecha" registro.txt | awk '$2 == "octal"')

                if [ -z "$resultado" ]; then
                    echo "No se encontraron registros para la fecha $fecha."
                else
                    echo "Resultados encontrados para la fecha $fecha:"
                    echo "$resultado" > "./$carpeta.txt"
                    echo "El archivo ha sido exportado."
                fi

                echo "Presiona Enter para volver al menú"
                read enter
                ;;
            6)  
                Salir3=false
                ;;
            *)
                echo "Opción no válida"
                ;;
        esac
        clear
    done  
}

Hexadecimal() {
    Salir4=true
     while [ $Salir4 == true ]; do
        echo " - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
        echo " - ¿Qué deseas hacer con la conversion en Hexadecimal? - "
        echo " - 1. Todas las conversiones en Hexadecimal            - "
        echo " - 2. Que tipo de conversion de Hexadecimal            - "
        echo " - 3. Fecha de ordenadas                               - "
        echo " - 4. Fecha especifica                                 - "
        echo " - 5. Exportar                                         - "
        echo " - 6. Salir                                            - "
        echo " - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
        read opcion_convers
        case $opcion_convers in
            1)
                resultado=$(awk '$2 == "hexadecimal"' "registro.txt")
                recuento=$(echo "$resultado" | wc -l)
                echo "Resultado final:"
                echo "$recuento"
                echo "$resultado"
                echo "Presiona Enter para volver al menú"
                read enter
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
                    echo "Presiona Enter para volver al menú"
                    read enter
                else
                recuento=$( echo "$resultado" | wc -l) #wc -l cada vez que imprime va contando
                echo "Resultado final:"
                echo "$recuento"
                echo "$resultado"
                echo "Presiona Enter para volver al menú"
                read enter
                fi
                ;;
            3)  
                echo "¿Quiere ver lo Nuevo o Antiguo?"
                read fecha

                if [ "$fecha" = "Nuevo" ]; then
                    resultado=$(sort -t '/' -k3,3n -k2,2n -k1,1n registro.txt | awk '$2 == "hexadecimal"')
                elif [ "$fecha" = "Antiguo" ]; then
                    resultado=$(sort
                     -t '/' -k3,3nr -k2,2nr -k1,1nr registro.txt | awk '$2 == "hexadecimal"')
                 
                fi

                echo "$resultado"
                echo "Presiona Enter para volver al menú"
                read enter
                ;;
            4)  
                echo "Introduce la fecha que quieres buscar: [dd/mm/aaaa]"
                read fecha
                if [[ $fecha =~ ^[0-9]{2}/[0-9]{2}/[0-9]{4}$ ]]; then
                    echo "Formato de fecha correcto."
                else
                    echo "Formato de fecha incorrecto. Debe ser [dd/mm/aaaa]."
                    Salir4=false
                fi
                
                resultado=$(grep "$fecha" registro.txt | awk '$2 == "hexadecimal"')

                if [ -z "$resultado" ]; then
                    echo "No se encontraron registros para la fecha $fecha."
                else
                    echo "Resultados encontrados para la fecha $fecha:"
                    echo "$resultado"
                fi
                echo "Presiona Enter para volver al menú"
                read enter
                ;;
             5)  
                echo "Introduce la fecha que quieres buscar: [dd/mm/aaaa]"
                read fecha
                echo "Introduce el nombre del fichero sin extension"
                read carpeta

                if [[ $fecha =~ ^[0-9]{2}/[0-9]{2}/[0-9]{4}$ ]]; then
                    echo "Formato de fecha correcto."
                else
                    echo "Formato de fecha incorrecto. Debe ser [dd/mm/aaaa]."
                    Salir4=false
                fi

                resultado=$(grep "$fecha" registro.txt | awk '$2 == "hexadecimal"')

                if [ -z "$resultado" ]; then
                    echo "No se encontraron registros para la fecha $fecha."
                else
                    echo "Resultados encontrados para la fecha $fecha:"
                    echo "$resultado" > "./$carpeta.txt"
                    echo "El archivo ha sido exportado."
                fi

                echo "Presiona Enter para volver al menú"
                read enter
                ;;
            6)  
                Salir4=false
                ;;
            *)
                echo "Opción no válida"
                ;;
        esac
        clear
    done   
}

# Verificar si el archivo "registro.txt" existe
if [ ! -f "registro.txt" ]; then 
    echo "Error: El archivo 'registro.txt' no ha sido encontrado."
else 
# Inicio del script
echo "Bienvenido a tu Registro"
# Menú de opciones
Salir5=true
while [ $Salir5 == true ];
do 
    echo " - - - - - - - - - - - - - - - - - - - - - - - - - "
    echo " - ¿Bienvenido qué acción quieres realizar?      - "
    echo " - 1. Decimal                                    - "
    echo " - 2. Binario                                    - "
    echo " - 3. Octal                                      - "
    echo " - 4. Hexadecimal                                - "
    echo " - 5. Salir                                      - "
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
            Salir5=false
            ;;
        *)
            echo "Opción no válida"
            ;;
    esac
    clear
done
fi