#!/bin/bash
echo " -------------------------------------- "
echo "|                                      |"
echo "|       Conversión de números          |"
echo "|   1. Convertir un número decimal     |"
echo "|   2. Convertir un número binario     |"
echo "|   3. Convertir un número octal       |"
echo "|   4. Convertir un número hexadecimal |"
echo "|   5. Historial                       |"
echo "|   6. Salir                           |"
echo "|                                      |"
echo " -------------------------------------- "
correct=true
while [ $correct == true ]
do
  echo "Introduzca una opción (1,2,3,4,5 o 6)"
  read option
  case $option in
    1)
      ./decimal.sh
      correct=false
      ;;
    2)
      ./binario.sh
      correct=false
      ;;
    3)
      ./octal.sh
      correct=false
      ;;
    4)
      ./hexadecimal.sh
      correct=false
      ;;
    5)
      ./Registro.sh
      correct=false
      ;;
    6)
      correct=false
      ;;
    *)
      echo "Seleccione una opción válida"
      ;;
  esac
done