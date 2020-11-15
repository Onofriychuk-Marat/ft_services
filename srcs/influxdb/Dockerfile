FROM alpine

RUN apk update 
RUN apk upgrade
RUN	apk	add supervisor 
RUN	apk	add wget

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN	wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN	apk add glibc-2.32-r0.apk
RUN	wget https://dl.influxdata.com/influxdb/releases/influxdb-1.8.2-static_linux_amd64.tar.gz
RUN	mkdir /var/lib/influxdb
RUN	tar xfz influxdb-1.8.2-static_linux_amd64.tar.gz
RUN	mv /influxdb-1.8.2-1 /etc/influxdb
RUN	rm -f influxdb-1.8.2-static_linux_amd64.tar.gz
RUN	wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.3_linux_amd64.tar.gz
RUN	tar xf telegraf-1.15.3_linux_amd64.tar.gz
RUN	cp -r /telegraf-1.15.3/* /
RUN	rm -rf /telegraf-1.15.3/ telegraf-1.15.3_linux_amd64.tar.gz
RUN	./usr/bin/telegraf -sample-config --input-filter docker \
						--output-filter influxdb > /etc/telegraf/telegraf.conf 

COPY srcs/init.sh			/var/
COPY srcs/supervisord.conf	/etc/

VOLUME /var/lib/influxdb

CMD sh /var/init.sh
