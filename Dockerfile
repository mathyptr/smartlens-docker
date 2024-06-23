FROM ubuntu
#LABEL Custom object detection in the browser using TensorFlow.js We- Mathilde Patrissi UniversitÓ di Firenze
RUN apt-get update	
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata git wget vim net-tools apache2 php php-mysql libapache2-mod-php mysql-server 

RUN apt-get -y install mysql-server 

RUN service mysql start \  
&& mysql -uroot -p1mathy1 < /home/Mathy/ServerWeb/doc/tipsitPerson.sql 
#EXPOSE 80
%RUN mkdir /home/mathy/
WORKDIR /var/www/html/
#CMD apachectl -D FOREGROUND
RUN git clone https://github.com/ReInHerit/SmartLens-app
RUN mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '1mathy1'"

#RUN mysqluser=root \
#&& strpw=1mathy1 
RUN mysql -e "CREATE DATABASE smartlensv"
RUN mysql -e "CREATE USER 'smartlens'@'localhost' IDENTIFIED BY '!smartlens!'"
RUN mysql mysql -e "GRANT ALL ON smartlens TO 'smartlens'@'localhost'"
#RUN mysql smartlens < /home/mathy/smartlens_db_dump.sql