# 使用官方 PHP-Apache 镜像
FROM daocloud.io/php:5.6-apache

# docker-php-ext-install 为官方 PHP 镜像内置命令，用于安装 PHP 扩展依赖
# pdo_mysql 为 PHP 连接 MySQL 扩展
RUN docker-php-ext-install pdo_mysql

# 安装必备软件
sudo apt-get -y wget curl vim 

# 安装composer
RUN curl -sS https://getcomposer.org/installer \
        | php -- --install-dir=/usr/local/bin --filename=composer
        
RUN  chmod +x  /usr/local/bin/composer  

RUN  composer global require "phpunit/phpunit=~4.0"  

# /var/www/html/ 为 Apache 目录
COPY . /var/www/html/
