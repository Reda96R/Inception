#!bin/bash
mv var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
wp config set DB_NAME testbase --allow-root --path=/var/www/wordpress/
wp config set DB_USER testuser --allow-root --path=/var/www/wordpress/
wp config set DB_PASSWORD 1234 --allow-root --path=/var/www/wordpress/
wp config set DB_HOST mariadb --allow-root --path=/var/www/wordpress/

wp core install     --url=rerayyad.42.fr --title=testtitle --admin_user=rerayyad --admin_password=rerayyad --admin_email=rerayyad@mail.com --allow-root --path='/var/www/wordpress'
wp user create      --allow-root --role=author rerayyad rerayyad@mail.com --user_pass=rerayyad --path='/var/www/wordpress' >> /log.txt
