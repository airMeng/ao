#!/bin/bash
# Copyright (c) Meta Platforms, Inc. and affiliates.
# All rights reserved.
#
# This source code is licensed under the license found in the
# LICENSE file in the root directory of this source tree.

# Call script with sh build_and_run_benchmarks.sh {BENCHAMRK}

export CMAKE_OUT=/tmp/cmake-out/torchao/benchmarks
cmake -DTORCHAO_LIBRARIES=${TORCHAO_LIBRARIES} \
    -S . \
    -B ${CMAKE_OUT} \
    -DOpenMP_ROOT=$(brew --prefix libomp) \
    -DTORCHAO_PARALLEL_OMP=ON

cmake --build ${CMAKE_OUT}

# Run
case "$1" in
    linear_operator) ${CMAKE_OUT}/benchmark_linear_operator; ;;
    *) echo "Unknown benchmark: $1. Please specify one of: linear_operator."; exit 1; ;;
esac