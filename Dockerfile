# Use the chialab/php:8.2-apache image as the base
FROM chialab/php:8.2-apache

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy the application code to the container
COPY . /var/www/html

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install Laravel dependencies
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Change ownership of the application files (adjust www-data as needed)
RUN chown -R www-data:www-data /var/www/html

# Optimize the Laravel framework for better performance (optional)
RUN php artisan optimize

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]