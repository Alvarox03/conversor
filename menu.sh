#!/bin/bash
#Menú principal
function menuPrincipal {
echo " -------------------------------------- "
echo "|                                      |"
echo "|       Conversión de números          |"
echo "|   1. Convertir un número decimal     |"
echo "|   2. Convertir un número binario     |"
echo "|   3. Convertir un número octal       |"
echo "|   4. Convertir un número hexadecimal |"
echo "|   5. Historial                       |"
echo "|   6. Gráfico de uso                  |"
echo "|   7. Salir                           |"
echo "|                                      |"
echo " -------------------------------------- "
}
menuPrincipal
correct=true
while [ $correct == true ]
do
  #Opciones
  echo "Introduzca una opción (1,2,3,4,5,6 o 7)"
  read option
  case $option in
    1)
      #Conversiones de decimal
      clear
      ./decimal.sh
      clear
      menuPrincipal
      ;;
    2)
      #Conversiones de binario
      clear
      ./binario.sh
      clear
      menuPrincipal
      ;;
    3)
      #Conversiones de octal
      clear
      ./octal.sh
      clear
      menuPrincipal
      ;;
    4)  
      #Conversiones de hexadecimal
      clear
      ./hexadecimal.sh
      clear
      menuPrincipal
      ;;
    5)
      #Registros
      clear
      ./Registro.sh
      clear
      menuPrincipal
      ;;
    6)
      #Gráfica de uso
      clear
      ./grafica.sh
      clear
      menuPrincipal
      ;;
    7)
      #Salir
      correct=false
      ;;
    *)
      echo "Seleccione una opción válida"
      ;;
  esac
done