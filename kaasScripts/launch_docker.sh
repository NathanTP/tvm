#!/bin/bash
# Need hard to remember options to docker to forward 8888 (for jupyter), enable GPUs, and to mount everything we need
set -euo pipefail

cd ../docker

docker run -it --rm --gpus=all --privileged -v $(pwd)/../:/host tvm:dev bash

# the port forward is for jupyter
# docker run -it --rm --gpus=all --privileged -v $(pwd)/../:/host -p 8888:8888 --expose 8888 tvm:dev bash
