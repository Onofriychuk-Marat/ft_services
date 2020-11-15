FROM alpine

RUN apk update && apk upgrade
RUN apk add nginx 
RUN apk add supervisor 
RUN apk add php7 php7-fpm php7-opcache php7-json \
		php7-gd php7-mysqli php7-zlib php7-curl 
RUN apk add wget

RUN mkdir -p /run/nginx /run/php 
RUN rm -f /etc/nginx/conf.d/default.conf

COPY srcs/nginx.conf		/etc/nginx/conf.d/
COPY srcs/init.sh			/var/
COPY srcs/supervisord.conf	/etc/

RUN wget https://wordpress.org/latest.tar.gz 
RUN tar -xf latest.tar.gz 
RUN mv wordpress /var/www/wordpress 
RUN rm -f latest.tar.gz 
RUN chmod 777 /var/www/*

COPY srcs/wp-config.php		/var/www/wordpress/

EXPOSE 5050
CMD sh /var/init.sh
