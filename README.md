# ArduPilot Containers

Contains Dockerfiles for Docker containers to build and test ArduPilot.

## Container Hierarchy

- [khancyr/ardupilot-dev-base](https://hub.docker.com/r/khancyr/ardupilot-dev-base) [![](https://images.microbadger.com/badges/image/khancyr/ardupilot-dev-base.svg)](http://microbadger.com/images/khancyr/ardupilot-dev-base) [![Docker Pulls](https://img.shields.io/docker/pulls/khancyr/ardupilot-dev-base.svg)](https://hub.docker.com/r/khancyr/ardupilot-dev-base)
- [khancyr/ardupilot-dev-base-chibios](https://hub.docker.com/r/khancyr/ardupilot-dev-base-chibios) [![](https://images.microbadger.com/badges/image/khancyr/ardupilot-dev-base-chibios.svg)](http://microbadger.com/images/khancyr/ardupilot-dev-base-chibios) [![Docker Pulls](https://img.shields.io/docker/pulls/khancyr/ardupilot-dev-base-chibios.svg)](https://hub.docker.com/r/khancyr/ardupilot-dev-base-chibios)
- [khancyr/ardupilot-dev-base-clang](https://hub.docker.com/r/khancyr/ardupilot-dev-base-clang) [![](https://images.microbadger.com/badges/image/khancyr/ardupilot-dev-base-clang.svg)](http://microbadger.com/images/khancyr/ardupilot-dev-base-clang) [![Docker Pulls](https://img.shields.io/docker/pulls/khancyr/ardupilot-dev-base-clang.svg)](https://hub.docker.com/r/khancyr/ardupilot-dev-base-clang)
- [khancyr/ardupilot-dev-base-armhf](https://hub.docker.com/r/khancyr/ardupilot-dev-base-armhf) [![](https://images.microbadger.com/badges/image/khancyr/ardupilot-dev-base-armhf.svg)](http://microbadger.com/images/khancyr/ardupilot-dev-base-armhf) [![Docker Pulls](https://img.shields.io/docker/pulls/khancyr/ardupilot-dev-base-armhf.svg)](https://hub.docker.com/r/khancyr/ardupilot-dev-base-armhf)
- [khancyr/ardupilot-dev-base-coverage](https://hub.docker.com/r/khancyr/ardupilot-dev-base-coverage) [![](https://images.microbadger.com/badges/image/khancyr/ardupilot-dev-base-coverage.svg)](http://microbadger.com/images/khancyr/ardupilot-dev-base-coverage) [![Docker Pulls](https://img.shields.io/docker/pulls/khancyr/ardupilot-dev-base-coverage.svg)](https://hub.docker.com/r/khancyr/ardupilot-dev-base-coverage)


## Building

```
cd docker
docker build -t khancyr/ardupilot-dev-base -f Dockerfile_dev-base .
```
