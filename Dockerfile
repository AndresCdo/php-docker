FROM php:7.2-apache

# Install required packages and extensions
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils \
    libmariadb-dev \
    && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-install mysqli \
    && docker-php-ext-enable mysqli

# Copy application files and set up Apache
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/AndresCdo/Color-Predictor.git -b dev /var/www/html
COPY ./php/src/index.php /var/www/html
RUN echo "ServerName localhost" >> /etc/apache2/httpd.conf \
    && sed -i "s/#ServerName www.example.com/ServerName localhost/" /etc/apache2/sites-available/000-default.conf \
    && a2enmod rewrite \
    && service apache2 restart
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get remove -y git
EXPOSE 80
