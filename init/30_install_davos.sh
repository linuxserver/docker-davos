#!/bin/bash

curl -o /app/davos.jar https://ci.linuxserver.io/job/davos/job/davos_03_Release/ws/build/libs/davos-1.0.jar

chown abc:abc /app/davos.jar
