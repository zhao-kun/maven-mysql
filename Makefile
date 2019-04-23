.PHONY: build


MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
MKFILE_DIR := $(dir $(MKFILE_PATH))

BUILD_DOCKER_IMAGE=zhaokundev/maven-mysql
BUILD_DOCKER_VERSION=mvn3.5.3-jdk8-sql5.7-slim
ALI_SRC_BUILD_DOCKER_VERSION=ali-mvn3.5.3-jdk8-sql5.7-slim

DOCKER_FILE=${MKFILE_DIR}/rootfs/Dockerfile
ALI_SRC_DOCKER_FILE=${MKFILE_DIR}/rootfs/Dockerfile.ali

DOCKER_BUILD_OPTION=-t ${BUILD_DOCKER_IMAGE}:${BUILD_DOCKER_VERSION} \
	-f "${DOCKER_FILE}" \
	"${MKFILE_DIR}"

ALI_SRC_DOCKER_BUILD_OPTION=-t ${BUILD_DOCKER_IMAGE}:${ALI_SRC_BUILD_DOCKER_VERSION} \
	-f "${ALI_SRC_DOCKER_FILE}" \
	"${MKFILE_DIR}"

build_image:
	docker build ${DOCKER_BUILD_OPTION}

build_ali_src_image:
	docker build ${ALI_SRC_DOCKER_BUILD_OPTION}
