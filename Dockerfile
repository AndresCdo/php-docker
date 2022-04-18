FROM php:7.2-apache
COPY src/ /var/www/html/
RUN apt-get update && apt-get install apt-utils -y
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y
RUN sh -c 'echo "ServerName localhost" >> /etc/apache2/httpd.conf'
RUN sh -c 'sed -i "s/#ServerName www.example.com/ServerName localhost/" /etc/apache2/sites-available/000-default.conf
RUN /etc/init.d/apache2 restart
EXPOSE 80
