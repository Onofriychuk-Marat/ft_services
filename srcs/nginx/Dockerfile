FROM alpine

RUN apk update
RUN apk add nginx 
RUN apk add sudo 
RUN apk add openssh 
RUN apk add supervisor

RUN mkdir -p /run/nginx /var/run/sshd /var/empty/sshd /var/www 
RUN touch /run/nginx/nginx.pid 
RUN rm -f /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf

COPY srcs/nginx.conf		/etc/nginx/nginx.conf
COPY srcs/index.html		/var/www/
COPY srcs/init.sh			/var/
COPY srcs/supervisord.conf	/etc/
COPY srcs/localhost.key		/etc/ssl/certs/localhost.key
COPY srcs/localhost.crt		/etc/ssl/certs/localhost.crt

RUN adduser -D utoomey && echo 'utoomey:pass' | chpasswd 
RUN addgroup utoomey wheel && echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel 
RUN /usr/bin/ssh-keygen -A

RUN chown -R root:root /var/www 
RUN chmod 755 -R /var/*

EXPOSE 80 443 22
CMD sh /var/init.sh
