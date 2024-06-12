FROM ubuntu:24.04

RUN apt update \
    && add-apt-repository ppa:ondrej/php \
    && apt update && apt install -y \
    software-properties-common \
    apache2 \
    mariadb-server \
    php8.1-fpm \
    php8.1-mysql \
    wget \
    mariadb-client \
    vim \
    nano \
    && apt-get clean

# RUN mkdir -p /var/www/html/adminer \
#     && wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer/index.php

# RUN touch /etc/apache2/conf-available/adminer.conf
# RUN echo "<FilesMatch \\.php$> \
# SetHandler 'proxy:unix:/run/php/php8.1-fpm.sock|fcgi://localhost/' \
# </FilesMatch>" >> /etc/apache2/conf-available/adminer.conf
# RUN a2enconf adminer.conf

# RUN a2dismod mpm_prefork
# RUN a2enmod proxy_fcgi setenvif mpm_event
# RUN a2enconf php8.1-fpm

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf \
    && a2enmod rewrite \
touch /var/www/html/info.php \
cat > /var/www/html/info.php <<EOL
<?php
  phpinfo();

EOL \

mkdir -p /var/www/html/adminer \

wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O /var/www/html/adminer/index.php \
wget https://wordpress.org/latest.tar.gz -O /tmp/latest.tar.gz \
tar -xvf /tmp/latest.tar.gz -C /var/www/html/ \
chown -R www-data:www-data /var/www/html/wordpress/ \
chmod -R 755 /var/www/html/wordpress/ \
mkdir /var/www/html/wordpress/wp-content/uploads \
chown -R www-data:www-data /var/www/html/wordpress/wp-content/uploads/ \
cat > /etc/apache2/sites-available/adminer.conf <<EOL
<VirtualHost *:80>
    DocumentRoot /var/www/html/adminer
    <Directory /var/www/html/adminer>
        Options FollowSymLinks
        AllowOverride None
        Require all granted
    </Directory>

    <FilesMatch \.php$>
        SetHandler "proxy:unix:/run/php/php8.1-fpm.sock|fcgi://localhost/"
    </FilesMatch>
</VirtualHost>
EOL \

a2ensite adminer.conf \
a2dismod mpm_prefork \
a2enmod proxy_fcgi setenvif mpm_event \
a2enconf php8.1-fpm \
echo "extension=mysqli" >> /etc/php/8.1/fpm/php.ini

COPY start.sh /start.sh

EXPOSE 8080


ENTRYPOINT ["/start.sh"]
