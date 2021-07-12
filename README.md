# Docker Laravel (Nginx, Postgres, Redis, PHP-FPM)
A docker multicontainer with nginx, postgres, redis and an example laravel project.

[![Build Status](https://travis-ci.com/s-shiryaev/docker-php8-laravel.svg?branch=master)](https://travis-ci.com/s-shiryaev/docker-php8-laravel)

## Installation
1. Build/run containers

    ```
    make build
    make run
    ```

2. Composer install
    ```
    make install
    ```
3. Don't forget generate `APP_KEY`
    ```
    make app-key
    ```
   Or if you want to do it manually:
    ```
    make exec
    php artisan key:generate
    ```
## How to Use

### Enter Php-fpm container

    make exec

Run whatever you want (E.g. `composer require `).


### Permissions
If you have problems with permissions on files, try to run command:

    make uid

Perhaps your user has a UID other than 1000


### List of all make commands
    make help


### Xdebug
Feel free to change xdebug config in [xdebug.ini](docker/php8-fpm/xdebug.ini) (For example `xdebug.idekey` if you are not using PHPStorm)