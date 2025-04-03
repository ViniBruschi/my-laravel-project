FROM php:8.3-apache-bullseye

# Instala dependências necessárias
RUN apt-get update -y && apt-get install -y libonig-dev zip unzip git

# Instala extensões PHP necessárias
RUN docker-php-ext-install pdo pdo_mysql

# Instala o Composer GLOBALMENTE
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Ativa mod_rewrite do Apache
RUN a2enmod rewrite

# Define diretório de trabalho
WORKDIR /var/www/html

# Copia os arquivos do projeto para o container
COPY . .

# Expõe a porta do Apache
EXPOSE 80

# Inicia o Apache
CMD ["apache2-foreground"]