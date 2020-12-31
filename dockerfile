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
RUN mv phpMyAdmin-5.0.4-all-languages /var/www/phpmyadmin

#Configuração wordpress
RUN tar -xf wordpress.tar.gz 
RUN mv wordpress /var/www/wordpress

#Configuração nginx
RUN mv ./config/phpadmin_server.conf /etc/nginx/sites-available/phpadmin_server.conf
RUN mv ./config/wordpress_server.conf /etc/nginx/sites-available/wordpress_server.conf
RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/phpadmin_server.conf /etc/nginx/sites-enabled/phpadmin_server.conf
RUN ln -s /etc/nginx/sites-available/wordpress_server.conf /etc/nginx/sites-enabled/wordpress_server.conf
RUN cd ..

#Limpando documentos programas e documentos desnecessários
RUN rm -rf ./config
RUN apt-get autoremove
RUN apt-get autoclean

EXPOSE 80/tcp 443/tcp


ENTRYPOINT ["sh", "config.sh"]