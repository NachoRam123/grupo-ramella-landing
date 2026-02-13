# Grupo Ramella Landing Page

Landing page desarrollada en Flutter Web para Grupo Ramella.

## Estructura del Proyecto
- `lib/`: Código fuente de la aplicación Flutter.
- `web/`: Archivos estáticos y configuración web.
- `Dockerfile`: Configuración para despliegue en Railway (Nginx).

## Pasos para subir a GitHub

Como este entorno no tiene acceso directo a Git, sigue estos pasos:

1.  **Inicializar Repositorio (Si no usaste el script)**:
    Abre una terminal en esta carpeta y ejecuta:
    ```bash
    git init
    git add .
    git commit -m "Initial commit"
    ```

2.  **Crear Repositorio en GitHub**:
    - Ve a [GitHub.com/new](https://github.com/new).
    - Crea un repositorio nuevo (ej: `grupo-ramella-landing`).
    - **NO** lo inicialices con README, .gitignore ni licencia (ya los tenemos).

3.  **Conectar y Subir**:
    En la terminal de esta carpeta, ejecuta los comandos que te da GitHub:
    ```bash
    git branch -M main
    git remote add origin https://github.com/TU_USUARIO/grupo-ramella-landing.git
    git push -u origin main
    ```

### Opción B: Si el comando `git` falla (Tu caso actual)

Al parecer **Git no está instalado** o configurado en tu terminal. No te preocupes, puedes hacerlo manualmente desde la web:

1.  Ve a tu repositorio en GitHub: `https://github.com/NachoRam123/grupo-ramella-landing`
2.  Haz clic en el enlace **"uploading an existing file"** (Subir un archivo existente).
3.  Arrastra y suelta **todos los archivos y carpetas** de la carpeta `golden-photosphere` hacia la ventana del navegador.
    - Asegúrate de incluir: `lib`, `web`, `assets`, `pubspec.yaml`, `Dockerfile`, etc.
4.  Escribe un mensaje en "Commit changes" (ej: "Subida inicial") y haz clic en el botón verde **"Commit changes"**.

Esto subirá todo tu código y funcionará igual para conectarlo a Railway.

## Despliegue en Railway

1.  Crea una cuenta en [Railway.app](https://railway.app/).
2.  Selecciona "New Project" -> "Deploy from GitHub repo".
3.  Selecciona el repositorio `grupo-ramella-landing`.
4.  Railway detectará automáticamente el `Dockerfile` y comenzará el despliegue.
5.  Una vez finalizado, Railway te dará una URL pública (ej: `web-production-xxxx.up.railway.app`).

## Ejecución Local (Requiere Flutter)

Si tienes Flutter instalado:
```bash
flutter run -d chrome
```
