#!bin/bash
wp core download --allow-root

wp config create --allow-root --dbname=testbase --dbuser=testuser --dbpass=1234 --dbhost=mariadb:3306 --path='/var/www/wordpress'

wp core install     --url=rerayyad.42.fr --title=testtitle --admin_user=rerayyad --admin_password=rerayyad --admin_email=rerayyad@mail.com --allow-root --path='/var/www/wordpress'

wp user create      --allow-root --role=author rerayyad2 rerayyad2@mail.com --user_pass=rerayyad --path='/var/www/wordpress'
