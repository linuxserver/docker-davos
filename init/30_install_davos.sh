#!/bin/bash

curl -o /app/davos.jar http://ci.linuxserver.io:8080/job/Davos/job/Release/ws/build/libs/davos-1.0.jar

chown abc:abc /app/davos.jar
