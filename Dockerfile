FROM lsiobase/alpine
MAINTAINER Josh Stark <jagfin1@gmail.com>

# package version
ARG DAVOS_VER="latest"

# install packages
RUN \
 apk add --no-cache \
	curl \
	openjdk8-jre

# install davos
RUN \
 mkdir -p \
	/app/davos && \
 curl -o \
 /app/davos/davos.jar -L \
	http://files.linuxserver.io/davos/davos-${DAVOS_VER}.jar

# add local files
COPY root/ /

# ports and volumes
EXPOSE 8080
VOLUME /config /download
