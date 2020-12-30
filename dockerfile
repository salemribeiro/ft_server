FROM debian:buster

WORKDIR /config

ENV PORT 8080:80

COPY ./srcs ./config

RUN apt-get update -y && apt upgrade -y

RUN apt-get install mariadb-server nginx wordpress wget php -y

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz

ENTRYPOINT [ "nginx"]

CMD nginx




