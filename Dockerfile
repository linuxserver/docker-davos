FROM lsiobase/alpine
MAINTAINER Josh Stark <jagfin1@gmail.com>

# add davos app
COPY build/libs/davos-2.0.0.jar /app/davos/davos.jar

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# install packages
RUN \
 apk add --no-cache \
	openjdk8-jre

# add local files
COPY root/ /

# ports and volumes
EXPOSE 8080
VOLUME /config /download
