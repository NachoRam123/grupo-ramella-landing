# Stage 1: Build the Flutter Web App
FROM ghcr.io/cirruslabs/flutter:stable AS build

WORKDIR /app

# Copy the project files
COPY . .

# Ensure web support is enabled
RUN flutter config --enable-web

# Run flutter create to generate any missing web files (like flutter_bootstrap.js)
# This is safe and won't overwrite existing source files like lib/ or pubspec.yaml
RUN flutter create . --platforms web

# Get dependencies
RUN flutter pub get

# Build the web application
RUN flutter build web --release

# Stage 2: Serve with Nginx
FROM nginx:alpine

# Copy the build artifacts from the build stage
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
