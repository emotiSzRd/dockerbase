#FROM debian:stretch-slim
FROM ubuntu:18.04
MAINTAINER William Yao <wmyaoyao@gmail.com>

# Add 18.10 repo for latest apache2
RUN echo " \
deb http://archive.ubuntu.com/ubuntu/ cosmic main restricted universe ">> /etc/apt/sources.list
#deb http://security.ubuntu.com/ubuntu/ cosmic-security main restricted universe

# NOTE: Speed up when building in TW
# RUN sed -i 's/archive.ubuntu.com/free.nchc.org.tw/g' \
#    /etc/apt/sources.list

# Install apache2:2.4.33
RUN apt-get update && \
    apt-get install -y apache2=2.4.33-3ubuntu2

# Setup timezone first or we'll stock later
RUN echo "Asia/Shanghai" > /etc/timezone
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y tzdata
RUN dpkg-reconfigure -f noninteractive tzdata

# Install php5.6 
# https://tecadmin.net/install-php5-on-ubuntu/
RUN apt-get install -y software-properties-common && \
    add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y php5.6 \
           php5.6-mysql \
           php5.6-xml php5.6-zip php5.6-json \
           php5.6-gd php5.6-bcmath \
           php5.6-mbstring php5.6-curl

# Apache + PHP requires preforking Apache for best results
RUN /usr/sbin/a2dismod mpm_event && /usr/sbin/a2enmod mpm_prefork

# Manually set up the apache environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid


EXPOSE 80

# By default, simply start apache.
CMD /usr/sbin/apache2ctl -D FOREGROUND
