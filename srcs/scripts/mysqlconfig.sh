#/bin/bash

mysql -e "CREATE USER 'wordpress'@'localhost' IDENTIFIED BY 'moonwalk';"
mysql -e "GRANT ALL PRIVILEGES ON * . * TO 'wordpress'@'localhost';"
mysql -e "CREATE DATABASE wordpress CHARACTER SET UTF8 COLLATE UTF8_BIN;"
mysql -e "USE wordpress; SOURCE /ft_server/wordpress.sql;"
