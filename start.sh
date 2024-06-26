usermod -d /var/lib/mysql/ mysql
service mysql start
apachectl -D FOREGROUND
