## Utiliser l'image de base Ubuntu
#FROM ubuntu:latest
##
#### Mettre à jour le système et installer les paquets nécessaires
#RUN apt update && apt install -y \
#    apache2 \
#    mariadb-server \
#    php-fpm \
#    php-mysql \
#    wget \
#    unzip \
#    && apt-get clean
##
### Installer Adminer
#RUN mkdir -p /var/www/html/adminer \
#    && wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer/index.php
#
#RUN touch /etc/apache2/conf-available/adminer.conf
#
#RUN echo "<FilesMatch \\.php$> \
#SetHandler 'proxy:unix:/run/php/php8.2-fpm.sock|fcgi://localhost/' \
#</FilesMatch>" >> /etc/apache2/conf-available/adminer.conf
#
#RUN a2enconf adminer.conf
#
#
#RUN mkdir -p /var/www/web
#
#RUN a2dismod mpm_prefork
#
#RUN a2enmod proxy_fcgi setenvif mpm_event
#
#RUN a2enconf php8.2-fpm
##
#### Configurer Apache
#RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf \
#    && a2enmod rewrite
##
#RUN /etc/init.d/apache2 start
##
### Activer les services au démarrage du conteneur
##COPY start.sh /start.sh
##RUN chmod +x /start.sh
##
#EXPOSE 8080
##
##CMD ["/start.sh"]
