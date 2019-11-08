# For security reason, we need a php5.6 with the latest apache (2.4.33)
# The image should be able to replace the official php5.6:apache image
FROM ubuntu18.04:apache2.4.41-nosrc
MAINTAINER Huanglp <huanglp@gmail.com>

# Add 18.10 repo for latest apache2
#RUN echo " \
#deb http://archive.ubuntu.com/ubuntu/ cosmic main restricted universe ">> /etc/apt/sources.list
#deb http://security.ubuntu.com/ubuntu/ cosmic-security main restricted universe

# NOTE: Speed up the download speed with a TW mirror
# RUN sed -i 's/archive.ubuntu.com/free.nchc.org.tw/g' \
#    /etc/apt/sources.list

# Install apache2:2.4.41
#RUN apt-get update
#RUN apt-get upgrade -y
#RUN apt install -y software-properties-common
#RUN add-apt-repository ppa:ondrej/apache2
#RUN apt update
#RUN apt install -y apache2

#RUN apt-get update && \
#    apt-get install -y apache2=2.4.41-3ubuntu2

# Setup timezone first or we'll be stuck when installing php (tzdata)
RUN echo "Asia/Shanghai" > /etc/timezone
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y tzdata
RUN dpkg-reconfigure -f noninteractive tzdata

# Install php5.6 fron non-official repo
# https://tecadmin.net/install-php5-on-ubuntu/
RUN add-apt-repository ppa:ondrej/php && \
    apt-get update && apt-get install -y \
      php5.6 \
      php5.6-bcmath \
      php5.6-curl \
      php5.6-mysql \
      php5.6-gd \
      php5.6-json \
      php5.6-mbstring \
      php5.6-mcrypt \
      php5.6-xml \
      php5.6-zip \
      pkg-config \
      && rm -rf /var/lib/apt/lists/*

# Install some other required packages
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*

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
