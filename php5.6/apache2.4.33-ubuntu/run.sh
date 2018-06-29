#!/bin/bash
docker rm -fv httpd2
#docker run -it -p 80:80 \
docker run -d -p 80:80 \
    --name httpd2 \
    -v /home/wmyao/workspaces/phpbase/sh/phpbase/html:/var/www/html \
docker-reg.emotibot.com.cn:55688/php5.6:apache2.4.33-ubuntu-2
#docker-reg.emotibot.com.cn:55688/php5.6:apache2.4.33-1


sleep 1

curl localhost/curl-check.php

#docker-reg.emotibot.com.cn:55688/php5.6:apache2.4.33-1
#docker-reg.emotibot.com.cn:55688/php7.1:apache2.4.33
