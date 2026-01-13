#!/bin/bash

# Define settings
MY_DPI=840
MY_ID="sample_345_346"

# Ensure directories exist
mkdir -p "$(pwd)/crop_tiles"
mkdir -p "$(pwd)/test_results"

# Map your local folders to the container's expected internal paths
docker run -it --rm \
  --platform linux/amd64 \
  --memory 6g \
  -v "$(pwd)/crop_tiles":/data/input \
  -v "$(pwd)/test_results":/data/output \
  quay.io/treeringgenomics/image-processing:master \
  --dpi $MY_DPI \
  --run_ID $MY_ID \
  --input /data/input \
  --output_folder /data/output \
  --print_detections yes \
  --cropUpandDown 0.17