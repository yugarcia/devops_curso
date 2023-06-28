#!/bin/bash

# this script show how we can use funtions to organiza
# and resuse our code.

help(){
    echo "Uso: $0 -n <nombre> -a <edad>"
    echo "  -n <nombre>: Especifica el nombre"
    echo "  -a <edad>: Especifica la edad"
}

while getopts ":n:a:h" opt; do
    case $opt in
        n)
        NOMBRE=$OPTARG
        ;;
        a)
        EDAD=$OPTARG
        ;;
        h)
            help
            exit 0
            ;;
        \?)
        # >&2 envia la salida al flujo de error
            echo "Opción inválida: -$OPTARG" >&2
            help
            exit 1
            ;;
        :)
            echo "La opción -$OPTARG requiere un argumento." >&2
            help
            exit 1
            ;;
    esac
done

# verificamos que las variables tengan algun valor asignado
# si no se cumple muestra un mensaje al usuario.

if [ -z "$NOMBRE" ] || [ -z "$EDAD" ]; then
    help
    exit 1
fi

echo "Hola $NAME. Tienes $EDAD años."