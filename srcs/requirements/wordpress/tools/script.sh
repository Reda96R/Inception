#!bin/bash
wp core download --allow-root

wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress'

wp core install     --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --allow-root --path='/var/www/wordpress'

wp user create      --allow-root --role=author $USER0_LOGIN $USER0_MAIL --user_pass=$USER_PASS --path='/var/www/wordpress'
