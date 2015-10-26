#!/bin/bash

[[ ! -f /app/davos.jar ]] && curl -o /app/davos.jar http://ci.linuxserver.io:8080/job/Davos/job/Release/ws/build/libs/davos-0.0.1-SNAPSHOT.jar

chown abc:abc /app/davos.jar
