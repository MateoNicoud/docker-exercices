#!/bin/bash

/etc/init.d/mariadb start
/etc/init.d/php8.1-fpm start
/etc/init.d/apache2 start

tail -f /var/log/apache2/*.log