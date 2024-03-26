#!bin/bash
wp core download --allow-root
# sleep 5
# wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress'

mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
wp config set DB_NAME $MYSQL_DATABASE --allow-root --path=/var/www/wordpress/
wp config set DB_USER $MYSQL_USER --allow-root --path=/var/www/wordpress/
wp config set DB_PASSWORD $MYSQL_PASSWORD --allow-root --path=/var/www/wordpress/
wp config set DB_HOST mariadb:3306 --allow-root --path=/var/www/wordpress/


wp core install     --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --allow-root --path='/var/www/wordpress'

wp user create      --allow-root --role=author $USER0_LOGIN $USER0_MAIL --user_pass=$USER0_PASS --path='/var/www/wordpress'
php-fpm7.4 -F
