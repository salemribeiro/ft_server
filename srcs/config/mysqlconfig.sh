#/bin/bash
mysql -e "UPDATE mysql.user SET Password=PASSWORD('1234') WHERE User='root';"
mysql -e "DELETE FROM mysql.user WHERE User='';"
mysql -e "DELETE FROM mysql.user WHERE User='root' AND HOST NOT IN ('localhost', '127.0.0.1', '::1');"