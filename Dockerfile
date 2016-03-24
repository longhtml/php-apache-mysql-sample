# 使用官方 PHP-Apache 镜像
FROM daocloud.io/php:5.6-apache

# docker-php-ext-install 为官方 PHP 镜像内置命令，用于安装 PHP 扩展依赖
# pdo_mysql 为 PHP 连接 MySQL 扩展
RUN docker-php-ext-install pdo_mysql

# 安装必备软件
# APT 自动安装 PHP 相关的依赖包，如需其他依赖包在此添加
RUN apt-get update \
    && apt-get -y install \
        curl \
        wget \
        vim \
        git \
			
    # 用完包管理器后安排打扫卫生可以显著的减少镜像大小
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \

    # 安装 Composer，此物是 PHP 用来管理依赖关系的工具
    # Laravel Symfony 等时髦的框架会依赖它
    && curl -sS https://getcomposer.org/installer \
        | php -- --install-dir=/usr/local/bin --filename=composer
        
RUN  chmod +x  /usr/local/bin/composer  

RUN  composer global require "phpunit/phpunit=~4.0"  

# /var/www/html/ 为 Apache 目录
COPY . /var/www/html/
