#!/bin/bash

source ../docker/env.sh

CMD="update"
PACKAGE=$1
if [ ! -z "${PACKAGE}" ]; then
	CMD="install ${PACKAGE}"
fi

docker run					\
	--rm					\
	--workdir /app			\
	--volume $(pwd):/app	\
	"node:${NODE_VERSION}"	\
	npm ${CMD} --save

