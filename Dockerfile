FROM php:7.4-cli

# Instalar Node.js, npm, unzip y dependencias del sistema
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    git \
    && curl -fsSL https://nodesource.com | bash - \
    && apt-get install -y nodejs

# Instalar la extensión mysqli de PHP
RUN docker-php-ext-install mysqli

# Instalar Composer globalmente
RUN curl -sS https://getcomposer.org | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /usr/src/app
COPY . .

# Instalar las dependencias de Composer dentro de la carpeta traductor
RUN cd traductor && composer install --no-dev --optimize-autoloader

CMD [ "php", "./index.php" ]
