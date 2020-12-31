#/bin/bash

#Copiando configurações dos bancos de dados    

#Iniciando serviços do container
service mysql start
service php7.3-fpm start
nginx -g "daemon off;"