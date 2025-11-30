FROM wordpress:6.4.3-php8.2-apache

# Enable Apache modules commonly needed by WordPress.
RUN a2enmod rewrite expires

# Increase PHP upload limits for media/library uploads.
COPY uploads.ini /usr/local/etc/php/conf.d/uploads.ini

# Copy the local WordPress code into the image and ensure correct ownership.
COPY . /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
