#!/bin/bash

echo " -------------------------------------- "
echo "|                                      |"
echo "|       Conversión de números          |"
echo "|   1. Convertir un número decimal     |"
echo "|   2. Convertir un número binario     |"
echo "|   3. Convertir un número octal       |"
echo "|   4. Convertir un número hexadecimal |"
echo "|   5. Historial                       |"
echo "|                                      |"
echo " -------------------------------------- "
read option

if [[ $option -eq 1 ]]
then
./decimal.sh
elif [[ $option -eq 2 ]]
then
./binario.sh
elif [[ $option -eq 3 ]]
then
./octal.sh
elif [[ $option -eq 4 ]]
then
./hexadecimal.sh
elif [[ $option -eq 5 ]]
then
./registro.sh
else
echo "Por favor introduzca una opción válida"
fi