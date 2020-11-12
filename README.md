# ArduPilot Containers

Contains Dockerfiles for Docker containers to build and test ArduPilot.

## Container Hierarchy

- [khancyr/ardupilot-dev-base](https://hub.docker.com/r/khancyr/ardupilot-dev-base) [![](https://images.microbadger.com/badges/image/khancyr/ardupilot-dev-base.svg)](http://microbadger.com/images/khancyr/ardupilot-dev-base) [![Docker Size](https://img.shields.io/docker/image-size/khancyr/ardupilot-dev-base/latest)](https://hub.docker.com/r/khancyr/ardupilot-dev-base) [![Docker Pulls](https://img.shields.io/docker/pulls/khancyr/ardupilot-dev-base.svg)](https://hub.docker.com/r/khancyr/ardupilot-dev-base)
- [khancyr/ardupilot-dev-chibios](https://hub.docker.com/r/khancyr/ardupilot-dev-chibios) [![](https://images.microbadger.com/badges/image/khancyr/ardupilot-dev-chibios.svg)](http://microbadger.com/images/khancyr/ardupilot-dev-chibios) [![Docker Size](https://img.shields.io/docker/image-size/khancyr/ardupilot-dev-chibios/latest)](https://hub.docker.com/r/khancyr/ardupilot-dev-chibios) [![Docker Pulls](https://img.shields.io/docker/pulls/khancyr/ardupilot-dev-chibios.svg)](https://hub.docker.com/r/khancyr/ardupilot-dev-chibios)
- [khancyr/ardupilot-dev-chibios-9](https://hub.docker.com/r/khancyr/ardupilot-dev-chibios-9) [![](https://images.microbadger.com/badges/image/khancyr/ardupilot-dev-chibios-9.svg)](http://microbadger.com/images/khancyr/ardupilot-dev-chibios-9) [![Docker Size](https://img.shields.io/docker/image-size/khancyr/ardupilot-dev-chibios-9/latest)](https://hub.docker.com/r/khancyr/ardupilot-dev-chibios-9) [![Docker Pulls](https://img.shields.io/docker/pulls/khancyr/ardupilot-dev-chibios-9.svg)](https://hub.docker.com/r/khancyr/ardupilot-dev-chibios-9)
- [khancyr/ardupilot-dev-clang](https://hub.docker.com/r/khancyr/ardupilot-dev-clang) [![](https://images.microbadger.com/badges/image/khancyr/ardupilot-dev-clang.svg)](http://microbadger.com/images/khancyr/ardupilot-dev-clang) [![Docker Size](https://img.shields.io/docker/image-size/khancyr/ardupilot-dev-clang/latest)](https://hub.docker.com/r/khancyr/ardupilot-dev-clang) [![Docker Pulls](https://img.shields.io/docker/pulls/khancyr/ardupilot-dev-clang.svg)](https://hub.docker.com/r/khancyr/ardupilot-dev-clang)
- [khancyr/ardupilot-dev-armhf](https://hub.docker.com/r/khancyr/ardupilot-dev-armhf) [![](https://images.microbadger.com/badges/image/khancyr/ardupilot-dev-armhf.svg)](http://microbadger.com/images/khancyr/ardupilot-dev-armhf) [![Docker Size](https://img.shields.io/docker/image-size/khancyr/ardupilot-dev-armhf/latest)](https://hub.docker.com/r/khancyr/ardupilot-dev-armhf) [![Docker Pulls](https://img.shields.io/docker/pulls/khancyr/ardupilot-dev-armhf.svg)](https://hub.docker.com/r/khancyr/ardupilot-dev-armhf)
- [khancyr/ardupilot-dev-coverage](https://hub.docker.com/r/khancyr/ardupilot-dev-coverage) [![](https://images.microbadger.com/badges/image/khancyr/ardupilot-dev-coverage.svg)](http://microbadger.com/images/khancyr/ardupilot-dev-coverage) [![Docker Size](https://img.shields.io/docker/image-size/khancyr/ardupilot-dev-coverage/latest)](https://hub.docker.com/r/khancyr/ardupilot-dev-coverage) [![Docker Pulls](https://img.shields.io/docker/pulls/khancyr/ardupilot-dev-coverage.svg)](https://hub.docker.com/r/khancyr/ardupilot-dev-coverage)


## Building

```
cd docker
docker build -t khancyr/ardupilot-dev-base -f Dockerfile_dev-base .
```
