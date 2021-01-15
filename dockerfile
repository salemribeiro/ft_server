FROM debian:buster

LABEL key="Repositório criado para prova de conceito de exercicio 42SP"

WORKDIR /config

COPY ./srcs ./

#Atualização de sistema
RUN apt-get update -y && apt-get upgrade -y

#Instalação dos php e servidores
RUN apt-get install mariadb-server php-fpm php-mysql php-mbstring php-zip php-gd nginx -y

#Instalação e configuração phpadmin
RUN tar -xf phpmyadmin.tar.gz
#RUN mv phpMyAdmin-5.0.4-all-languages /var/www/phpmyadmin

#Configuração wordpress
RUN tar -xf wordpress.tar.gz 

#Retirando arquivos default
RUN rm /etc/nginx/sites-available/default
RUN rm /etc/nginx/sites-enabled/default

#Copiando e linkando arquivos de configuração nginx
RUN cp ./config/nginx.conf /etc/nginx/sites-available/nginx.conf
#RUN cp ./config/phpadmin.conf /etc/nginx/sites-available/phpadmin.conf
RUN cp ./config/php.ini /etc/php/7.3/fpm/php.ini

#Criando links simbolicos
RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf
#RUN ln -s /etc/nginx/sites-available/phpadmin.conf /etc/nginx/sites-enabled/phpadmin.conf

#Copiando arquivos de sites
RUN cp ./sites/info.php /var/www/html/info.php


#RUN mv wordpress /var/www/wordpress
#Configuração nginx
#RUN mv ./config/phpadmin_server.conf /etc/nginx/sites-available/phpadmin_server.conf
#RUN mv ./config/wordpress_server.conf /etc/nginx/sites-available/wordpress_server.conf
#RUN rm /etc/nginx/sites-enabled/default
#RUN ln -s /etc/nginx/sites-available/phpadmin_server.conf /etc/nginx/sites-enabled/phpadmin_server.conf
#RUN ln -s /etc/nginx/sites-available/wordpress_server.conf /etc/nginx/sites-enabled/wordpress_server.conf

RUN mkdir -p /var/www/phpadmin
#RUN chown user-da-sua-app:user-da-sua-app /var/www/sua-app

RUN cd ..

#Limpando documentos programas e documentos desnecessários
RUN rm -rf ./config
RUN apt-get autoremove
RUN apt-get autoclean

EXPOSE 80/tcp 443/tcp

ENTRYPOINT ["sh", "config.sh"]