#!/bin/bash
#Adrià Escarceller i Cid

function IntURL(){
    echo -n "Introduce una URL: " 
    read URL
}

function CHECK(){
    curl --connect-timeout 3 $URL > /dev/null 2>&1 
    

    if [[ "$?" -eq 0 ]];
    
    then 
        echo "URL correcta"
        
    else
        echo "URL incorrecta"
        exit 1;
    fi
}

function FIREFOX(){
	
    echo "La pagina $URL se abrira en Firefox" 
    firefox $URL & 
}


