# @reference:
#   https://github.com/z-song/redis-manager
FROM composer:1.9.0
ENV REDIS_HOST \
    REDIS_PASSWORD \
    REDIS_PORT 
RUN    composer create-project --prefer-dist laravel/laravel redis-manager 5.7 \
    && cd redis-manager \
    && composer require encore/redis-manager \
    && php artisan vendor:publish --provider='Encore\RedisManager\RedisManagerServiceProvider' \
    && sed -i 's#redis-manager#/#g' config/redis-manager.php 
WORKDIR /app/redis-manager
USER root
EXPOSE 8000 1087
ENTRYPOINT [ "" ]
#CMD [ "php artisan serve --host=0.0.0.0" ] 
CMD [ "php", "artisan", "serve", "--host=0.0.0.0" ] 
