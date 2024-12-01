#!/bin/bash

# Variables
URL="https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US"
DEST="/opt/firefox-developer-edition"
TEMP_DIR="/tmp/firefox-developer"

# Descargar el archivo más reciente
echo "Descargando Firefox Developer Edition..."
mkdir -p $TEMP_DIR
cd $TEMP_DIR

# Descargar el archivo con nombre dinámico
wget -q --content-disposition "$URL"

# Detectar el archivo descargado
FILE=$(ls | grep "firefox-.*\.tar\.bz2")
if [[ -z "$FILE" ]]; then
    echo "Error: No se encontró el archivo descargado."
    exit 1
fi

echo "Archivo descargado: $FILE"

# Extraer y mover los archivos
echo "Instalando en $DEST..."
sudo rm -rf $DEST
sudo mkdir -p $DEST
sudo tar -xjf $FILE -C $DEST --strip-components=1

# Crear un enlace simbólico en /usr/local/bin
sudo ln -sf $DEST/firefox /usr/local/bin/firefox-developer-edition

# Limpiar el directorio temporal
cd ~
rm -rf $TEMP_DIR

echo "Firefox Developer Edition actualizado correctamente."
