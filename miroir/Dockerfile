# Miroir local du wiki Ecolibre — lot 22 du SGDT.
# Socle de production : PHP 7.4.33 sous Apache. Le code MediaWiki n'est pas
# dans l'image : il est monté depuis ${MIROIR_DATA}/coeur/mediawiki-1.39.
FROM php:7.4-apache

# Debian 11 (bullseye), base de php:7.4, a quitté les miroirs courants :
# ses paquets ne se trouvent plus que sur archive.debian.org.
RUN sed -i 's|http://deb.debian.org|http://archive.debian.org|g' /etc/apt/sources.list \
    && apt-get update && apt-get install -y --no-install-recommends \
      libicu-dev libzip-dev libpng-dev libjpeg62-turbo-dev \
      libfreetype6-dev libxml2-dev imagemagick diffutils \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j"$(nproc)" intl calendar mysqli gd zip opcache \
         bcmath exif pcntl \
    && pecl install apcu && docker-php-ext-enable apcu \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*

# Limites PHP de la production, relevées le 9 octobre 2026 (lot 22, tâche 6).
COPY php-miroir.ini /usr/local/etc/php/conf.d/miroir.ini

# URL courtes : $wgScriptPath vide, $wgArticlePath = '/wiki/$1'.
COPY apache-miroir.conf /etc/apache2/conf-available/miroir.conf
RUN a2enconf miroir
