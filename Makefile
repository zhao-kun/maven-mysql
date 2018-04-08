.PHONY: build


MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
MKFILE_DIR := $(dir $(MKFILE_PATH))

BUILD_DOCKER_IMAGE=zhaokundev/maven-mysql
BUILD_DOCKER_VERSION=mvn3.5.3-jdk8-sql5.7-slim

DOCKER_FILE=${MKFILE_DIR}/rootfs/Dockerfile

DOCKER_BUILD_OPTION=-t ${BUILD_DOCKER_IMAGE}:${BUILD_DOCKER_VERSION} \
	-f "${DOCKER_FILE}" \
	"${MKFILE_DIR}"

build_image:
	docker build ${DOCKER_BUILD_OPTION}
