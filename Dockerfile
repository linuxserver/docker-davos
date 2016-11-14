FROM lsiobase/alpine
MAINTAINER Josh Stark <jagfin1@gmail.com>

# add davos app
COPY build/libs/ /app/davos/

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# install packages
RUN \
 apk add --no-cache \
	curl \
	openjdk8-jre && \

# rename and chmod davos app
 mv /app/davos/*.jar /app/davos/davos.jar && \
 chmod 755 /app/davos/davos.jar

# add local files
COPY root/ /

# ports and volumes
EXPOSE 8080
WORKDIR /app/davos
VOLUME /config /download
