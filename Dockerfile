FROM composer:1.9.0
RUN    composer create-project --prefer-dist laravel/laravel redis-manager \
    && composer require encore/redis-manager \
    && cd redis-manager \
    && php artisan vendor:publish --provider='Encore\RedisManager\RedisManagerServiceProvider'
CMD [ "php artisan serve --host=0.0.0.0" ] 
