#!/bin/bash
set -e

# Descargar Flutter
git clone https://github.com/flutter/flutter.git -b stable --depth 1
export PATH="$PATH:`pwd`/flutter/bin"

# Mostrar versión (debug)
flutter --version

# Instalar dependencias
flutter pub get

# Build Flutter Web
flutter build web --release
