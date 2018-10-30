FROM wpengine/php:7.2

RUN apt-get update
RUN apt-get install -y \
	zip \
	unzip \
	ssh \
  git \
  && rm -rf /var/lib/apt/lists/*

RUN curl -Lso /tmp/composer-setup.php https://getcomposer.org/installer
RUN php /tmp/composer-setup.php --install-dir=/usr/bin --filename=composer --version=1.7.2
RUN rm -f /tmp/composer-setup.php

RUN curl -Lso /usr/local/bin/phpunit https://phar.phpunit.de/phpunit-7.phar
RUN chmod +x /usr/local/bin/phpunit

RUN mkdir /var/www/.composer
RUN chown -R www-data:www-data /var/www
RUN find /var/www -type d -exec chmod 775 {} \;
RUN find /var/www -type f -exec chmod 664 {} \;

USER www-data
WORKDIR /app

CMD ["/bin/bash"]
