FROM ubuntu:14.04
MAINTAINER Victor Rachieru

#-#
#-# Config
#-#

ENV WORDPRESS_VERSION latest

ENV MYSQL_DATABASE wordpress
ENV MYSQL_USERNAME admin
ENV MYSQL_PASSWORD admin


#-#
#-# System
#-#

RUN apt-get update
RUN apt-get -y upgrade

RUN DEBIAN_FRONTEND=noninteractive


#-#
#-# Tools
#-#

# Install
RUN apt-get -y install pwgen python-setuptools
RUN easy_install supervisor

# Config
COPY ./configs/supervisord.conf /etc/supervisord.conf
RUN mkdir /var/log/supervisor/


#-#
#-# Apache
#-#

# Install
RUN apt-get -y install apache2 libapache2-mod-php5 pwgen

# Scripts
COPY ./scripts/apache2-foreground.sh /etc/apache2/foreground.sh
RUN chmod 755 /etc/apache2/foreground.sh

# Config
COPY ./configs/apache2.conf /etc/apache2/sites-available/000-default.conf


#-#
#-# MySQL
#-#

# Install
RUN apt-get -y install mysql-server

# Config
COPY ./scripts/mysql-config.sh /mysql-config.sh
RUN chmod 755 /mysql-config.sh
RUN ./mysql-config.sh


#-#
#-# PHP
#-# 

# Install
RUN apt-get -y install php5-mysql php5-ldap php5-gd php5-curl

# Config
RUN sed -i "s/upload_max_filesize.*/upload_max_filesize = 20M/g" /etc/php5/apache2/php.ini


#-#
#-# Wordpress
#-#

# Install
ADD https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz /wordpress-${WORDPRESS_VERSION}.tar.gz
RUN tar xvzf /wordpress-${WORDPRESS_VERSION}.tar.gz 
RUN rm -rf /var/www/
RUN mv /wordpress /var/www/
RUN chown -R www-data:www-data /var/www/

# Config
COPY ./scripts/wp-config.sh /wp-config.sh
RUN chmod 755 /wp-config.sh
RUN ./wp-config.sh


#-#
#-# Main
#-#

EXPOSE 80
CMD supervisord -n