#!/bin/bash
# Just build all image in docker directory

set -e
set -x

pushd docker
echo "BUILDING BASE"
docker build -t ardupilot/ardupilot-dev-base:latest -f Dockerfile_dev-base .
echo "BUILDING CLANG"
docker build -t ardupilot/ardupilot-dev-clang:latest -f Dockerfile_dev-clang .
echo "BUILDING CHIBIOS"
docker build -t ardupilot/ardupilot-dev-chibios:latest -f Dockerfile_dev-chibios .
echo "BUILDING CHIBIOS CLANG"
docker build -t ardupilot/ardupilot-dev-chibios-clang:latest -f Dockerfile_dev-chibios-clang .
echo "BUILDING CHIBIOS PY2"
docker build -t ardupilot/ardupilot-dev-chibios-py2:latest -f Dockerfile_dev-chibios-py2 .
echo "BUILDING AARCH64"
docker build -t ardupilot/ardupilot-dev-aarch64:latest -f Dockerfile_dev-aarch64 .
echo "BUILDING ARMHF"
docker build -t ardupilot/ardupilot-dev-armhf:latest -f Dockerfile_dev-armhf .
echo "BUILDING ARMHF MUSL"
docker build -t ardupilot/ardupilot-dev-armhf-musl:latest -f Dockerfile_dev-armhf-musl .
echo "BUILDING COVERAGE"
docker build -t ardupilot/ardupilot-dev-coverage:latest -f Dockerfile_dev-coverage .
echo "BUILDING PERIPH"
docker build -t ardupilot/ardupilot-dev-periph:latest -f Dockerfile_dev-periph .
echo "BUILDING ROS2"
docker build -t ardupilot/ardupilot-dev-ros:latest -f Dockerfile_dev-ros .
popd
