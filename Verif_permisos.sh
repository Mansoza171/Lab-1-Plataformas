#!/bin/bash

#Se verifica el archivo como argumento
if [ $# -eq 0 ]; then
    echo "Error: Proporcione un archivo como argumento"
    exit 1
fi

#Se guarda el nombre del archivo
file_path="$1"

#Verificacion de existencia del archivo
if [ ! -e "$file_path" ]; then
    echo "Error: El archivo '$file_path' no existe"
    exit 1
fi 

#Obtencion de los permisos del archivo
permissions=$(stat -c "%A" "$file_path")

#Se obtienen los permisos con el comando verbose
get_permissions_verbose() {
    local permissions="$1"

    user_permissions="${permissions:1:3}"
    group_permissions="${permissions:4:3}"
    otherusers_permissions="${permissions:7:3}"

    #Verificacion de permisos del usuario 
    if [ "${user_permissions:0:1}" = "r" ]; then
        echo "El usuario tiene permisos de lectura."
            else 
                echo "El usuario no tiene permisos de lectura"
    fi

    if [ "${user_permissions:1:1}" = "w" ]; then
        echo "El usuario tiene permisos de escritura"
            else 
                echo "El usuario no tiene permisos de escritura"
    fi

    if [ "${user_permissions:2:1}" = "x" ]; then
        echo "El usuario tiene permisos de ejecucion"
            else 
                echo "El usuario no tiene permisos de ejecucion"
    fi

    #Verificacion de permisos del grupo
    if [ "${group_permissions:0:1}" = "r" ]; then
        echo "El grupo tiene permisos de lectura."
            else 
                echo "El grupo no tiene permisos de lectura"
    fi

    if [ "${group_permissions:1:1}" = "w" ]; then
        echo "El grupo tiene permisos de escritura"
            else 
                echo "El grupo no tiene permisos de escritura"
    fi

    if [ "${group_permissions:2:1}" = "x" ]; then
        echo "El grupo tiene permisos de ejecucion"
            else 
                echo "El grupo no tiene permisos de ejecucion"
    fi

    #Verificacion de permisos para otros usuarios
    if [ "${otherusers_permissions:0:1}" = "r" ]; then
        echo "Otros tienen permisos de lectura."
            else 
                echo "Otros no tienen permisos de lectura"
    fi

    if [ "${otherusers_permissions:1:1}" = "w" ]; then
        echo "Otros tienen permisos de escritura"
            else 
                echo "Otros no tienen permisos de escritura"
    fi

    if [ "${otherusers_permissions:2:1}" = "x" ]; then
        echo "Otros tiene permisos de ejecucion"
            else 
                echo "Otros no tienen permisos de ejecucion"
    fi
}

#Obtencion de los permisos en formato legible
get_permissions_verbose "$permissions"