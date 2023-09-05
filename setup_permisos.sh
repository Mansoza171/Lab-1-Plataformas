#!/bin/bash

#Se reciben dos strings como argumentos
if [ $# -ne 2 ]; then
    echo "Error: indique un usuario y el grupo"
    exit 1
fi

new_user="$1"
group="$2"

#Creacion de usuario con nombre de mascota
if id "$new_user" &>/dev/null; then
    echo "El usuario $new_user ya existe"
else
    sudo useradd "$new_user"
    echo "Se creo $new_user"
fi

#Verificacion de existencia del grupo
if grep -q "^$group" /etc/group; then
    echo "El grupo '$group' ya existe"
else
    sudo groupadd "$group"
    echo "Grupo '$group' creado"
fi

#Se agrega usuario default y nuevo usuario al grupo
sudo usermod -aG "$group" "$USER"
sudo usermod -aG "$group" "$new_user"
echo "Usuario '$new_user' agregado al grupo '$group'"

#Asignacion de permisos de ejecucion solo para miembros de lab1
sudo chmod 750 Verif_permisos.sh
sudo chown :"$group" Verif_permisos.sh
