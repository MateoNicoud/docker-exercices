FROM ubuntu:24.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends software-properties-common \
    && add-apt-repository ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    apache2 \
    mariadb-server \
    php8.1-fpm \
    php8.1-mysql \
    wget \
    && apt-get clean \
    && printf "ServerName localhost\n" >> /etc/apache2/apache2.conf \
    && a2enmod rewrite \
    && rm -f /var/www/html/index.html \
    && touch /var/www/html/info.php \
    && printf "<?php phpinfo(); ?>" > /var/www/html/info.php \
    && mkdir -p /var/www/html/adminer \
    && wget --progress=dot:giga https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O /var/www/html/adminer/index.php \
    && wget --progress=dot:giga https://wordpress.org/latest.tar.gz -O /tmp/latest.tar.gz \
    && tar -xvf /tmp/latest.tar.gz --strip-components=1 -C /var/www/html/ \
    && chown -R www-data:www-data /var/www/html/ \
    && chmod -R 755 /var/www/html/ \
    && mkdir /var/www/html/wp-content/uploads \
    && chown -R www-data:www-data /var/www/html/ \
    && printf "<VirtualHost *:80>\n    DocumentRoot /var/www/html/adminer\n    <Directory /var/www/html/adminer>\n        Options FollowSymLinks\n        AllowOverride None\n        Require all granted\n    </Directory>\n    <FilesMatch \\.php$>\n        SetHandler 'proxy:unix:/run/php/php8.1-fpm.sock|fcgi://localhost/'\n    </FilesMatch>\n</VirtualHost>\n" > /etc/apache2/sites-available/adminer.conf \
    && a2ensite adminer.conf \
    && a2dismod mpm_prefork \
    && a2enmod proxy_fcgi setenvif mpm_event \
    && a2enconf php8.1-fpm \
    && printf "extension=mysqli\n" >> /etc/php/8.1/fpm/php.ini \
    && rm -rf /var/lib/apt/lists/*

COPY start.sh /start.sh

EXPOSE 8080

ENTRYPOINT ["/start.sh"]
