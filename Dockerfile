FROM ubuntu:24.04

RUN apt update \
    && apt install -y software-properties-common \
    && add-apt-repository ppa:ondrej/php \
    && apt update \
    && apt install -y \
    apache2 \
    mariadb-server \
    php8.1-fpm \
    php8.1-mysql \
    wget \
    mariadb-client \
    vim \
    nano \
    && apt-get clean \
    && echo "ServerName localhost" >> /etc/apache2/apache2.conf \
    && a2enmod rewrite \
    && touch /var/www/html/info.php \
    && echo "<?php phpinfo(); ?>" >> /var/www/html/info.php \
    && mkdir -p /var/www/html/adminer \
    && wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O /var/www/html/adminer/index.php \
    && wget https://wordpress.org/latest.tar.gz -O /tmp/latest.tar.gz \
    && tar -xvf /tmp/latest.tar.gz -C /var/www/html/ \
    && chown -R www-data:www-data /var/www/html/wordpress/ \
    && chmod -R 755 /var/www/html/wordpress/ \
    && mkdir /var/www/html/wordpress/wp-content/uploads \
    && chown -R www-data:www-data /var/www/html/wordpress/wp-content/uploads/ \
    && echo "<VirtualHost *:80> \n    DocumentRoot /var/www/html/adminer \n    <Directory /var/www/html/adminer> \n        Options FollowSymLinks \n        AllowOverride None \n        Require all granted \n    </Directory> \n    <FilesMatch \.php$> \n        SetHandler 'proxy:unix:/run/php/php8.1-fpm.sock|fcgi://localhost/' \n    </FilesMatch> \n</VirtualHost>" > /etc/apache2/sites-available/adminer.conf \
    && a2ensite adminer.conf \
    && a2dismod mpm_prefork \
    && a2enmod proxy_fcgi setenvif mpm_event \
    && a2enconf php8.1-fpm \
    && echo "extension=mysqli" >> /etc/php/8.1/fpm/php.ini

COPY start.sh /start.sh

EXPOSE 8080

ENTRYPOINT ["/start.sh"]
