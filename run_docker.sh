#!/bin/bash

# Get the absolute path of the script's directory
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Define paths for datasets and data directories
DATASETS_DIR="$SCRIPT_DIR/datasets"
DATA_DIR="$SCRIPT_DIR/data"
MODELS_DIR="$SCRIPT_DIR/models"
RUNS_DIR="$SCRIPT_DIR/runs"
SETUP_DIR="$SCRIPT_DIR/setup"

# Set default value for shared memory size
SHARED_MEMORY_SIZE="24g"

# Run the Docker command with shared memory size option
sudo docker run --ipc=host --gpus all --shm-size="$SHARED_MEMORY_SIZE" -it -p 8888:8888 -v "$DATASETS_DIR:/usr/src/datasets" -v "$DATA_DIR:/usr/src/app/data" -v "$MODELS_DIR:/usr/src/app/models" -v "$SETUP_DIR:/usr/src/app/setup" -v "$RUNS_DIR:/usr/src/app/runs" ultralytics/yolov5:latest

