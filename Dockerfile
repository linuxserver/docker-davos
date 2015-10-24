FROM linuxserver/baseimage
MAINTAINER Josh Stark <jagfin1@gmail.com>

ENV APTLIST="oracle-java8-set-default oracle-java8-installer"


RUN add-apt-repository ppa:webupd8team/java && \
apt-get update -q && \
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections && \
apt-get install $APTLIST -qy && \
apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

#Adding Custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run /etc/my_init.d/*.sh

# Volumes and Ports
VOLUME /config /download
EXPOSE 8080
