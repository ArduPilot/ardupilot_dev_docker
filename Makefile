TAG ?= latest
REGISTRY ?= ardupilot

DOCKER_DIR = docker

DOCKER_BUILD = docker build -t $(REGISTRY)/ardupilot-dev-$(1):$(TAG) -f $(DOCKER_DIR)/Dockerfile_dev-$(1) --build-arg TAG=$(TAG) $(DOCKER_DIR)

.PHONY: all base clang chibios chibios-clang aarch64 armhf armhf-musl coverage periph esp32 ros ros-humble ros-jazzy

all: clang chibios-clang aarch64 armhf-musl coverage periph esp32 ros

base:
	$(call DOCKER_BUILD,base)

clang: base
	$(call DOCKER_BUILD,clang)

chibios: base
	$(call DOCKER_BUILD,chibios)

chibios-clang: chibios
	$(call DOCKER_BUILD,chibios-clang)

aarch64: base
	$(call DOCKER_BUILD,aarch64)

armhf: base
	$(call DOCKER_BUILD,armhf)

armhf-musl: armhf
	$(call DOCKER_BUILD,armhf-musl)

coverage: base
	$(call DOCKER_BUILD,coverage)

periph: coverage
	$(call DOCKER_BUILD,periph)

esp32: base
	$(call DOCKER_BUILD,esp32)

ros: ros-humble ros-jazzy

ros-humble:
	docker build --build-arg ROS_DISTRO=humble -t $(REGISTRY)/ardupilot-dev-ros:humble -f $(DOCKER_DIR)/Dockerfile_dev-ros $(DOCKER_DIR)

ros-jazzy:
	docker build --build-arg ROS_DISTRO=jazzy -t $(REGISTRY)/ardupilot-dev-ros:jazzy -f $(DOCKER_DIR)/Dockerfile_dev-ros $(DOCKER_DIR)
