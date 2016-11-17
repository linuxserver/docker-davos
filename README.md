[linuxserverurl]: https://linuxserver.io
[forumurl]: https://forum.linuxserver.io
[ircurl]: https://www.linuxserver.io/irc/
[podcasturl]: https://www.linuxserver.io/podcast/

[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)][linuxserverurl]

The [LinuxServer.io][linuxserverurl] team brings you another container release featuring easy user mapping and community support. Find us for support at:
* [forum.linuxserver.io][forumurl]
* [IRC][ircurl] on freenode at `#linuxserver.io`
* [Podcast][podcasturl] covers everything to do with getting the most from your Linux Server plus a focus on all things Docker and containerisation!

# linuxserver/davos
[![](https://images.microbadger.com/badges/version/linuxserver/davos.svg)](https://microbadger.com/images/linuxserver/davos "Get your own version badge on microbadger.com")[![](https://images.microbadger.com/badges/image/linuxserver/davos.svg)](http://microbadger.com/images/linuxserver/davos "Get your own image badge on microbadger.com")[![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/davos.svg)][hub][![Docker Stars](https://img.shields.io/docker/stars/linuxserver/davos.svg)][hub][![Build Status](http://jenkins.linuxserver.io:8080/job/Software/job/Davos/job/davos_40_Docker/badge/icon)](http://jenkins.linuxserver.io:8080/job/Software/job/Davos/job/davos_40_Docker/)
[hub]: https://hub.docker.com/r/linuxserver/davos/

_davos_ is an FTP automation tool that periodically scans given host locations for new files. It can be configured for various purposes, including listening for specific files to appear in the host location, ready for it to download and then move, if required. It also supports completion notifications as well as downstream API calls, to further the workflow.

[![davos](https://raw.githubusercontent.com/linuxserver/davos/master/docs/list.PNG)][davosurl]
[davosurl]: https://github.com/linuxserver/davos

## Usage

```
docker create \
  --name=davos \
  -v <path to data>:/config \
  -v <path to downloads folder>:/download
  -e PGID=<gid> -e PUID=<uid>  \
  -p 8080:8080 \
  linuxserver/davos
```

## Parameters

`The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side.
For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container.
So -p 8080:80 would expose port 80 from inside the container to be accessible from the host's IP on port 8080
http://192.168.x.x:8080 would show you what's running INSIDE the container on port 80.`


* `-p 8080` - This is the default port that _davos_ runs under.
* `-v /config` - _davos_'s config location. This is where it stores its database file and logs.
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation

It is based on alpine linux with s6 overlay, for shell access whilst the container is running do `docker exec -it davos /bin/bash`.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application

The application does not require any set up other than starting the docker container. Further documentation can be found on the [davos GitHub repository page][davosurl].

## Info

* Shell access whilst the container is running: `docker exec -it davos /bin/bash`
* The main application logs are **not** output to the docker logs (this is just used for the framework initialisation). To view the logs, run: `tail -f <path to data>/logs/davos.log`, where `<path to data>` is the volume you mapped to `/config`.

* container version number

`docker inspect -f '{{ index .Config.Labels "build_version" }}' davos`

* image version number

`docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/davos`

## Versions

+ **14.11.16:** Initial creation of documentation
