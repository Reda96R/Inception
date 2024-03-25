#!/bin/bash

service mariadb start
mariadb -u root -e "CREATE DATABASE IF NOT EXISTS testbase;"
mariadb -u root -e "CREATE USER IF NOT EXISTS 'testuser'@'%' IDENTIFIED BY 'testpass';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON testbase.* TO 'testuser'@'%';"
mariadb -u root -e "FLUSH PRIVILEGES;"

# mariadb -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');"
# mariadb -u root -e "FLUSH PRIVILEGES;"
#
# mariadb -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
# mariadb -u root -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

kill $(cat /var/run/mysqld/mysqld.pid);
