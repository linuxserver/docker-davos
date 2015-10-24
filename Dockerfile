FROM linuxserver/baseimage
MAINTAINER Josh Stark <jagfin1@gmail.com>

ENV APTLIST="oracle-java8-installer"

RUN add-apt-repository ppa:webupd8team/java && \
apt-get update -q && \
apt-get install $APTLIST -qy && \
apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

RUN mkdir /opt/davos

#Adding Custom files
ADD init/ /etc/my_init.d/
ADD exec/davos.jar /opt/davos/davos.jar

WORKDIR /opt/davos

# Volumes and Ports
VOLUME /config /download
EXPOSE 8080
