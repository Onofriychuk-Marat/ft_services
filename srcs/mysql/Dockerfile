FROM alpine

RUN apk update && apk upgrade
RUN apk add mariadb mariadb-client openrc 

VOLUME /var/lib/mysql

COPY ./srcs/setup_request.sql	/var/
COPY ./srcs/wordpress.sql		/var/
COPY ./srcs/init.sh				/var/
COPY ./srcs/my.cnf				/etc/mysql/

RUN chmod 744	/etc/mysql/my.cnf

EXPOSE 3306
CMD sh /var/init.sh
