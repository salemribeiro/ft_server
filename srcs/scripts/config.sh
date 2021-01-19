#/bin/bash

chown www-data.www-data /var/www/sites/wordpress/* -R

if [ $N_AUTOINDEX == 0 ]
then
    sed -i 's/autoindex on/autoindex off/g' /etc/nginx/sites-available/nginx.conf
fi
#Iniciando serviços do container
service mysql start
service php7.3-fpm start
bash /ft_server/scripts/mysqlconfig.sh
nginx -g "daemon off;"