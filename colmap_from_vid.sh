#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title COLMAP
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🎥
# @raycast.argument1 { "type": "text", "placeholder": "Path to video file" }
# @raycast.argument2 { "type": "text", "placeholder": "Frame interval (default: 12)", "optional": true }

# Documentation:
# @raycast.description Create a SfM point cloud from input video
# @raycast.author pananananas
# @raycast.authorURL https://raycast.com/pananananas


# Get params
VIDEO_PATH="$1"
FRAME_INTERVAL="${2:-12}"  # Default to 12 if not specified

echo "Starting COLMAP from video ${VIDEO_PATH} with frame interval ${FRAME_INTERVAL}!"

# Extract directory and filename without extension
DIR_PATH=$(dirname "$VIDEO_PATH")
FILENAME=$(basename "$VIDEO_PATH" | sed 's/\.[^.]*$//')

# Create necessary directories
FRAMES_DIR="$DIR_PATH/${FILENAME}_frames"
WORKSPACE_DIR="$DIR_PATH/${FILENAME}_workspace"

mkdir -p "$FRAMES_DIR"
mkdir -p "$WORKSPACE_DIR"

# Extract frames with specified interval
ffmpeg -i "$VIDEO_PATH" -vf "select=not(mod(n\,${FRAME_INTERVAL}))" -vsync vfr "$FRAMES_DIR/frame_%06d.jpg"

# Run COLMAP automatic reconstruction
colmap automatic_reconstructor \
   --workspace_path "$WORKSPACE_DIR" \
   --image_path "$FRAMES_DIR" \
   --camera_model OPENCV \
   --dense 1

# Convert model to PLY
colmap model_converter \
   --input_path "$WORKSPACE_DIR/sparse/0" \
   --output_path "$DIR_PATH/${FILENAME}_pointcloud.ply" \
   --output_type PLY

echo "Process completed! Point cloud saved as ${FILENAME}_pointcloud.ply"