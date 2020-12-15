#!/bin/bash

# set -euo pipefail

cd ../

LLVM_OPT="set(USE_LLVM llvm-config-9)"
CUDA_OPT="set(USE_CUDA ON)"

# This makes the option append idempotent
grep -qxF "$CUDA_OPT" config.cmake || echo $CUDA_OPT >> config.cmake 
grep -qxF "$LLVM_OPT" config.cmake || echo $LLVM_OPT >> config.cmake 

# grep -qxF echo set\(USE_LLVM llvm-config-9\) >> config.cmake
# echo set\(USE_CUDA ON\) >> config.cmake

# Normally you'd use these optimized libraries but we're trying to simplify for
# KaaS
# echo set\(USE_CUDNN ON\) >> config.cmake
# echo set\(USE_BLAS openblas\) >> config.cmake

mkdir -p build
cd build

cmake ..
make -j4
