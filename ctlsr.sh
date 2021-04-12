#!/bin/bash

function muestra_servicios {
echo "SERVEIS A POSAR EN MARXA:"
echo "a) cups"
echo "b) ssh"
echo "c) apache2"
echo -n "Selecciona una opció: "
read opc	
return 0
}

function ctrl_servicios {
case $opc in
	a) systemctl status cups > /dev/null 
	   if [[ $? -ne 0 ]] 
	   then				 
			systemctl start cups  
	   fi
	   ;;
	b) systemctl status ssh > /dev/null
	   if [[ $? -ne 0 ]]
	   then
			systemctl start ssh 	
		   fi
;;
	c) systemctl status apache2 > /dev/null
	   if [[ $? -ne 0 ]]
	   then
		systemctl start apache2 
	   fi
;; 
*) echo "Opción incorrecta";;
	esac
}

if (( EUID != 0 ))
then
  echo "El script se tiene que ejecutar con permisos de administrador"
  exit 1 
fi
muestra_servicios
ctrl_servicios
exit 9
