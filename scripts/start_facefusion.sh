#!/usr/bin/env bash

if [[ ${RUNPOD_CPU_COUNT} ]]
then
    # Temporarily store the value
    THREAD_COUNT=${RUNPOD_CPU_COUNT}

    # Check if it's greater than 32
    if [[ ${THREAD_COUNT} -gt 32 ]]
    then
        export THREAD_COUNT=32
    else
        export THREAD_COUNT=${THREAD_COUNT}
    fi
else
    export THREAD_COUNT=8
fi

echo "Starting FaceFusion"
export HF_HOME="/workspace"
cd /workspace/facefusion
eval "$(micromamba shell hook --shell bash)"
micromamba activate facefusion
export GRADIO_SERVER_NAME="0.0.0.0"
export GRADIO_SERVER_PORT="3001"
nohup python3 facefusion.py run \
    --execution-thread-count ${THREAD_COUNT} \
    --execution-providers cuda > /workspace/logs/facefusion.log 2>&1 &
echo "FaceFusion started"
echo "Log file: /workspace/logs/facefusion.log"
micromamba deactivate
