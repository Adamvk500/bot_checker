FROM node:16-slim AS node
FROM composer:2.2 AS composer
FROM php:7.4-cli

# Copiar Node y Composer
COPY --from=node /usr/local /usr/local
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Instalar librerías del sistema
RUN apt-get update && apt-get install -y unzip git \
    && docker-php-ext-install mysqli \
    && rm -rf /var/lib/apt/lists/*

# Configurar la ruta de Arturo
WORKDIR /home/arturo/www
COPY . .

# Instalar dependencias únicamente donde existen archivos composer.json
RUN cd traductor && composer install --no-dev --optimize-autoloader
RUN cd Capsolver && composer install --no-dev --optimize-autoloader

CMD [ "php", "./index.php" ]
