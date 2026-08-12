FROM php:7.4-cli
RUN docker-php-ext-install mysqli
WORKDIR /usr/src/app
COPY . .
CMD [ "php", "./index.php" ]
