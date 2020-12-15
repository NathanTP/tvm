#!/bin/bash
set -euo pipefail

cd ../docker

DOCKERARGS="--build-arg USER=$USER --build-arg UID=$(id -u) --build-arg GID=$(id -g)"
echo $DOCKERARGS

docker build $DOCKERARGS --tag tvm:dev -f Dockerfile.dev .
