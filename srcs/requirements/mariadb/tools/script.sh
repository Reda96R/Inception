#!/bin/bash

service mariadb start
mariadb -u root -e "CREATE DATABASE IF NOT EXISTS testbase;"
mariadb -u root -e "CREATE USER IF NOT EXISTS 'testuser'@'%' IDENTIFIED BY '1234';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON testbase.* TO 'testuser'@'%';"
mariadb -u root -e "FLUSH PRIVILEGES;"

mariadb -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('4321');"
mariadb -u root -e "FLUSH PRIVILEGES;"

mariadb -u root -p4321 -e "GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY '4321';"
mariadb -u root -p4321 -e "FLUSH PRIVILEGES;"

kill $(cat /var/run/mysqld/mysqld.pid);
