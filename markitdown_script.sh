#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title MARKITDOWN
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 📝
# @raycast.argument1 { "type": "text", "placeholder": "Path to pdf file" }

# Documentation:
# @raycast.description Create a markdown file from pdf
# @raycast.author pananananas
# @raycast.authorURL https://raycast.com/pananananas


# Get params
PDF_PATH="$1"

# Check if file exists
if [ ! -f "$PDF_PATH" ]; then
    echo "Error: File ${PDF_PATH} does not exist!"
    exit 1
fi

# Extract directory and filename without extension
DIR_PATH=$(dirname "$PDF_PATH")
FILENAME=$(basename "$PDF_PATH" | sed 's/\.[^.]*$//')
OUTPUT_PATH="$DIR_PATH/${FILENAME}.md"

echo "Starting MARKITDOWN from pdf ${PDF_PATH}!"

# Run MARKITDOWN with proper output specification
if markitdown "$PDF_PATH" -o "$OUTPUT_PATH"; then
    echo "Process completed! Markdown file saved as ${FILENAME}.md"
else
    echo "Error: Failed to convert PDF to markdown"
    exit 1
fi
