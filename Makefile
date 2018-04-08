.PHONY build


MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
MKFILE_DIR := $(dir $(MKFILE_PATH))

BUILD_DOCKER_IMAGE=zhao-kun/maven-mysql
BUILD_DOCKER_VERSION=maven-3.5.3-jkd-8-mysql-5-7-slim

DOCKER_FILE=${MKFILE_PATH}/rootfs/Dockerfile

DOCKER_BUILD_OPTION=-t ${BUILD_DOCKER_IMAGE}:${BUILD_DOCKER_VERSION} \
	-f "${DOCKER_FILE}" \
	"${MKFILE_PATH}"

build_image:
	docker build ${DOCKER_BUILD_OPTION}