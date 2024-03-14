# service mysql start;
# sleep 1;
# mysql -e "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;";
# mysql -e "CREATE USER IF NOT EXISTS \`$MYSQL_USER/`@'%' IDENTIFIED BY '$MYSQL_PASSWORD';";
# mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';";
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
# mysql -e "FLUSH PRIVILEGES;";
# kill $(cat /var/run/mysqld/mysqld.pid);
# sleep 2;
# exec mysqld_safe

service mysql start;
sleep 1;
mysql -e "CREATE DATABASE IF NOT EXISTS test;";
mysql -e "CREATE USER IF NOT EXISTS testuser@'%' IDENTIFIED BY 1234;";
mysql -e "GRANT ALL PRIVILEGES ON test.* TO testuser@'%' IDENTIFIED BY 1234;";
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 1234;"
mysql -e "FLUSH PRIVILEGES;";
kill $(cat /var/run/mysqld/mysqld.pid);
sleep 2;
exec mysqld_safe
