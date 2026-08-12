# Usamos una imagen que ya incluye Node.js de forma nativa
FROM node:16-slim AS node
FROM php:7.4-cli

# Copiamos Node.js desde la imagen anterior sin descargar de internet
COPY --from=node /usr/local /usr/local

# Instalar unzip, git y la extensión mysqli necesaria para tu base de datos
RUN apt-get update && apt-get install -y unzip git \
    && docker-php-ext-install mysqli \
    && rm -rf /var/lib/apt/lists/*

# Instalar Composer para gestionar las dependencias del traductor
RUN curl -sS https://getcomposer.org | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /usr/src/app
COPY . .

# Instalar los paquetes del traductor
RUN cd traductor && composer install --no-dev --optimize-autoloader

CMD [ "php", "./index.php" ]
