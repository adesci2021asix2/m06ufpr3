#!/bin/bash
#Adrià Escarceller i Cid
if [ $EUID -ne 0 ]
then
	echo "EL SCRIPT DEBE SER EJECUTADO CON PERMISOS DE ADMINISTRADOR"
	exit 1
	
fi
clear

REGEX='^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$'
echo -n "ESCRIBE LA PRIMERA DIRECCION DEL DNS: "
read DNS1
echo -n "ESCRIBE LA SEGUNDA DIRECCION DEL DNS: "
read DNS2

if [[ $DNS1 =~ $REGEX ]] && [[ $DNS2 =~ $REGEX ]]

then
	echo "nameserver $DNS1" >> /etc/resolv.conf
	echo "nameserver $DNS2" >> /etc/resolv.conf
	
else
	echo "DIRECCION DNS NO VALIDA. EL PROGRAMA SE CERRARA"
	exit 1
	
fi
exit 0
