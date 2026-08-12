# Traemos Node y Composer desde sus imágenes oficiales directamente
FROM node:16-slim AS node
FROM composer:2.2 AS composer
FROM php:7.4-cli

# Copiamos Node.js y Composer al sistema principal sin descargar nada de internet
COPY --from=node /usr/local /usr/local
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Instalar unzip, git y la extensión mysqli necesaria para tu bot
RUN apt-get update && apt-get install -y unzip git \
    && docker-php-ext-install mysqli \
    && rm -rf /var/lib/apt/lists/*

# Establecemos la ruta de la aplicación donde el bot espera que esté
WORKDIR /home/arturo/www
COPY . .

# Instalar los paquetes del traductor en la ruta correcta
RUN cd traductor && composer install --no-dev --optimize-autoloader

CMD [ "php", "./index.php" ]
