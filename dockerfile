FROM debian:buster

LABEL key="Repositório criado para prova de conceito de exercicio 42SP"

WORKDIR /ft_server

ENV N_AUTOINDEX 1

#Atualização de sistema
RUN apt-get update -y && apt-get upgrade -y

#Instalação dos php e servidores
RUN apt-get install mariadb-server \
    php-fpm php-mysql \
    nginx -y

COPY ./srcs ./

#configuração de servicos
COPY ./srcs/sites /var/www/sites

#Removendo configuração original
RUN rm /etc/nginx/sites-available/default && rm /etc/nginx/sites-enabled/default

#Copiando e linkando arquivos de configuração nginx
COPY ./srcs/config/* /etc/nginx/sites-available/

#Criando links simbolicos
RUN ln -s /etc/nginx/sites-available/* /etc/nginx/sites-enabled/

#Implementacao de chaves e certificados
COPY ./srcs/ssl /etc/ssl
RUN rm -rf config && rm -rf php.ini && rm -rf ssl
#Limpando programas desnecessarios
RUN apt-get autoremove && apt-get autoclean

#limpando documentos desnecessarios
RUN rm -rf sites;

EXPOSE 80/tcp 443/tcp

ENTRYPOINT ["bash", "./scripts/config.sh"]