FROM wpengine/php:7.2
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
ENTRYPOINT ["/bin/bash"]
CMD ["composer"]