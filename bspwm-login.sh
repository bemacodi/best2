#!/bin/bash

if [[ $(whoami) != "root" ]]; then
    echo "Este script debe ser ejecutado como root o con permisos de superusuario."
    exit 1
fi

echo "Ingresa tu contraseña para iniciar sesión en bspwm: "
read -s PASSWORD

if ! echo "$PASSWORD" | sudo -S -u $USER startx /usr/bin/bspwm -- :0 >/dev/null 2>&1; then
    echo "Contraseña incorrecta."
    exit 1
fi

