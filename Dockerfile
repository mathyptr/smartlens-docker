FROM ubuntu
#LABEL Custom object detection in the browser using TensorFlow.js We- Mathilde Patrissi Università di Firenze
RUN apt-get update	
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata git wget vim net-tools apache2 php php-mysql libapache2-mod-php mysql-server 

#EXPOSE 80
RUN mkdir /home/mathy/
WORKDIR /home/mathy/
#CMD apachectl -D FOREGROUND
RUN git clone https://github.com/ReInHerit/SmartLens-app.git
RUN git clone https://github.com/mathyptr/smartlens-docker.git
RUN cp -r SmartLens-app /var/www/html/
#RUN mysqluser=root \
#&& strpw=1mathy1 

RUN service mysql start \
&& mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '1mathy1'" \
&& mysql -e "CREATE DATABASE smartlens" \
&& mysql -e "CREATE USER 'smartlens'@'localhost' IDENTIFIED BY '!smartlens!'" \
&& mysql mysql -e "GRANT ALL ON smartlens.* TO 'smartlens'@'localhost'" \
&& mysql smartlens < /home/mathy/smartlens-docker/smartlens_db_dump.sql
RUN sed -i 's/localhost/127.0.0.1/g' /var/www/html/SmartLens-app/server/config.php
RUN sed -i 's/Listen 80/Listen 0.0.0.0:10000/g' /etc/apache2/ports.conf
#ENTRYPOINT service mysql start && service apache2 start  && /bin/bash
CMD ["mysql", "start"]
CMD ["apachectl", "-D", "FOREGROUND"]
