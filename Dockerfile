FROM httpd:2.4
#COPY ./dockertest.local.conf /etc/apache2/sites-available/
COPY ./public-html/ /usr/local/apache2/htdocs/
