#/bin/bash

#Criando diretórios para sites
mkdir -m /var/www/wordpress
mkdir -m /var/www/phpmyadmin
mkdir -m /var/www/nginx

#Iniciando serviços do container
service mysql start
service php7.3-fpm start
./mysqlconfig.sh
nginx -g "daemon off;"