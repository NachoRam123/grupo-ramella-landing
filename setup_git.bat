@echo off
echo Inicializando repositorio Git...
git init
echo.
echo Agregando archivos...
git add .
echo.
echo Realizando commit inicial...
git commit -m "Initial commit: Landing page Grupo Ramella"
echo.
echo ========================================================
echo LISTO! El repositorio local ha sido creado.
echo.
echo Para subirlo a GitHub, ejecuta los siguientes comandos
echo (reemplazando la URL por la de tu nuevo repositorio):
echo.
echo git branch -M main
echo git remote add origin https://github.com/TU_USUARIO/REPO.git
echo git push -u origin main
echo ========================================================
pause
