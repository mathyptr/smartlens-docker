FROM ubuntu
#LABEL Custom object detection in the browser using TensorFlow.js We- Mathilde Patrissi Università di Firenze
RUN apt-get update
RUN apt-get remove mysql-server
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata git wget vim net-tools apache2 php php-mysql libapache2-mod-php mysql-server 

RUN service mysql start
#EXPOSE 80
#RUN mkdir /home/mathy/
#CMD apachectl -D FOREGROUND
WORKDIR /var/www/html/
RUN git clone https://github.com/ReInHerit/SmartLens-app
RUN git clone https://github.com/mathyptr/smartlens-docker.git
#RUN mv /home/mathy/SmartLens-app /var/www/html/
RUN mysql -h localhost -P 3306 --protocol=tcp -e "CREATE DATABASE smartlensv"
RUN mysql -h localhost -P 3306 --protocol=tcp -e "CREATE USER 'smartlens'@'localhost' IDENTIFIED BY '!smartlens!'"
RUN mysql -h localhost -P 3306 --protocol=tcp mysql -e "GRANT ALL ON smartlens TO 'smartlens'@'localhost'"
RUN mysql -h localhost -P 3306 --protocol=tcp smartlens < smartlens_db_dump.sql
#RUN mysql smartlens < /home/mathy/smartlens_db_dump.sql
#WORKDIR /var/www/html/
