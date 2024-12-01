# Firefox Developer Updater

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)

Un script sencillo y automatizado para descargar, instalar y actualizar **Firefox Developer Edition** en sistemas Linux. Diseñado específicamente para usuarios que instalan el navegador manualmente desde el sitio oficial y desean una forma más eficiente de mantenerlo actualizado.

## Características

- Descarga automáticamente la última versión de Firefox Developer Edition desde el sitio oficial.
- Detecta el nombre dinámico del archivo descargado (por ejemplo, `firefox-134.0b3.tar.bz2`).
- Instala el navegador en la ruta especificada (`/opt/firefox-developer-edition` por defecto).
- Crea o actualiza un enlace simbólico en `/usr/local/bin` para facilitar su uso.
- Limpia los archivos temporales después de la instalación.

## Requisitos

- Bash (normalmente incluido en la mayoría de distribuciones Linux).
- `wget` para manejar las descargas.
- Permisos de superusuario (`sudo`) para instalar en `/opt` y crear enlaces en `/usr/local/bin`.

## Instalación

1. Clona este repositorio:
   ```bash
   git clone https://github.com/tu-usuario/firefox-developer-updater.git
   cd firefox-developer-updater
   ```

2. Da permisos de ejecución al script:
   ```bash
   chmod +x update-firefox-developer.sh
   ```

3. Ejecuta el script con permisos de superusuario:
   ```bash
   sudo ./update-firefox-developer.sh
   ```

## Personalización

Si deseas cambiar la ruta de instalación o el idioma de la descarga, edita las siguientes variables en el script:

- **`DEST`**: Ruta donde se instalará Firefox Developer Edition (por defecto: `/opt/firefox-developer-edition`).
- **`URL`**: URL de descarga (por defecto: idioma inglés `en-US`).

Ejemplo para español:
```bash
URL="https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=es-ES"
```

## Verificación

Para comprobar que la instalación fue exitosa, ejecuta:
```bash
firefox-developer-edition --version
```

## Licencia

Este proyecto se distribuye bajo la licencia [MIT](LICENSE).

## Contribuciones

¡Contribuciones, reportes de errores y sugerencias son bienvenidos! Siéntete libre de abrir un _issue_ o enviar un _pull request_.

## Autor

Desarrollado por Alberto Mier (<info@albertomier.com>).
