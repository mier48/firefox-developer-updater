#!/bin/bash

# Variables
URL="https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=es-ES"
DEST="/opt/firefox-developer-edition"
TEMP_DIR="/tmp/firefox-developer"

# Descargar el archivo más reciente
echo "Descargando Firefox Developer Edition..."
mkdir -p "$TEMP_DIR"
cd "$TEMP_DIR" || { echo "Error: No se pudo cambiar al directorio temporal."; exit 1; }

# Descargar el archivo con nombre dinámico
wget -q --content-disposition "$URL"

# Detectar el archivo descargado
FILE=$(ls | grep -E "firefox-.*\.(tar\.bz2|tar\.xz)")
if [[ -z "$FILE" ]]; then
    echo "Error: No se encontró el archivo descargado."
    exit 1
fi

echo "Archivo descargado: $FILE"

# Verificar el tipo de archivo y extraerlo
echo "Instalando en $DEST..."
if [[ "$FILE" == *.tar.bz2 ]]; then
    if ! tar -tjf "$FILE" &>/dev/null; then
        echo "Error: El archivo descargado no es un archivo .tar.bz2 válido."
        exit 1
    fi
    sudo rm -rf "$DEST"
    sudo mkdir -p "$DEST"
    sudo tar -xjf "$FILE" -C "$DEST" --strip-components=1
elif [[ "$FILE" == *.tar.xz ]]; then
    if ! tar -tJf "$FILE" &>/dev/null; then
        echo "Error: El archivo descargado no es un archivo .tar.xz válido."
        exit 1
    fi
    sudo rm -rf "$DEST"
    sudo mkdir -p "$DEST"
    sudo tar -xJf "$FILE" -C "$DEST" --strip-components=1
else
    echo "Error: Formato de archivo no soportado."
    exit 1
fi

# Crear un enlace simbólico en /usr/local/bin
if sudo ln -sf "$DEST/firefox" /usr/local/bin/firefox-developer-edition; then
    echo "Enlace simbólico creado correctamente."
else
    echo "Error: No se pudo crear el enlace simbólico."
    exit 1
fi

# Limpiar el directorio temporal
cd ~ || exit
rm -rf "$TEMP_DIR"

echo "Firefox Developer Edition actualizado correctamente."
