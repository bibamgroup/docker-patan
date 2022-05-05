FROM ubuntu:18.04

RUN apt-get update  && \
	apt-get install -y software-properties-common && \
	LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php && \
    apt-get install -y tzdata && \
	apt-get update && \
	apt-get install -y git \
	wget \
    vim \
    nano \
    mc \
    curl \
	net-tools \
	supervisor \
	php-xml \
	php7.4 \	
	php7.4-dev \
	php7.4-mbstring \
	php7.4-mongodb \
	php7.4-soap \
	php7.4-xml \
	php7.4-gmp \
	php7.4-zip \
	php7.4-fpm \
	php7.4-curl \
	php7.4-tokenizer \
	php7.4-apcu \	
	php7.4-dev \
	php7.4-odbc \	
	php7.4-pdo-odbc \
	php7.4-pdo-mysql \
	php7.4-pdo-dblib \
	php7.4-mysqli \
	php-bcmath \
	apache2 \
	unixodbc-dev \
  php-pear \
  php-dev \
	&& rm -rf /var/lib/apt/lists/* 

RUN mkdir -p /run/php/
RUN mkdir /var/lib/mongodb

RUN update-alternatives --set php /usr/bin/php7.4
RUN update-alternatives --set php /usr/bin/php7.4
RUN update-alternatives --set phar /usr/bin/phar7.4
RUN update-alternatives --set phar.phar /usr/bin/phar.phar7.4
RUN update-alternatives --set phpize /usr/bin/phpize7.4
RUN update-alternatives --set php-config /usr/bin/php-config7.4

RUN pecl -d php_suffix=7.4 install sqlsrv
RUN pecl -d php_suffix=7.4 install pdo_sqlsrv
RUN pecl install mongodb-1.12.1

RUN echo "extension=sqlsrv.so" >> /etc/php/7.4/fpm/php.ini
RUN echo "extension=pdo_sqlsrv.so" >> /etc/php/7.4/fpm/php.ini
