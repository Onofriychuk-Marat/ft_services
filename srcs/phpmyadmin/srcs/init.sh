#!/bin/sh

wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-english.tar.gz 
tar -xf phpMyAdmin-4.9.5-english.tar.gz 
mv phpMyAdmin-4.9.5-english /var/www/phpmyadmin 
rm -f phpMyAdmin-4.9.5-english.tar.gz 
mkdir /var/www/phpmyadmin/tempdir 
chmod 777 -R /var/www/* 
mv /var/config.inc.php /var/www/phpmyadmin/ 
chmod 755 /var/www/phpmyadmin/config.inc.php

/usr/bin/supervisord -c /etc/supervisord.conf

