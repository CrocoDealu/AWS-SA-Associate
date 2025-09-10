#!/bin/bash

OUTPUT_DIR="/tmp/s3-bash-scripts"

if [ -e $OUTPUT_DIR ]; then
    rm -r "$OUTPUT_DIR"
fi

mkdir -p $OUTPUT_DIR

NUM_FILES=$((RANDOM % 6 + 5))

for ((i=1; i <=$NUM_FILES; i++)); do

    RANDOM_FILENAME="$OUTPUT_DIR/file_$i.txt"

    dd if=/dev/urandom of="$RANDOM_FILENAME" bs=1024 count=$((RANDOM % 1024 + 1)) 2>/dev/null
done

ls -la $OUTPUT_DIR