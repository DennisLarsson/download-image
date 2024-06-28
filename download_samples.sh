#!/bin/bash

SAMPLES_JSON=$1
POPMAP=$2
SAMPLES_DIR=$3

while IFS= read -r LINE; do
    SAMPLE_NAME=$(echo "$LINE" | cut -f1)
    ID=$(jq -r --arg key "${SAMPLE_NAME}.fq.gz" '.[$key]' $SAMPLES_JSON)
    if [[ $ID == "null" ]]; then
        echo "Error: Sample ${SAMPLE_NAME}.fq.gz not found in samples.json" >&2
        exit 1
    else
        echo "Downloading ${SAMPLE_NAME}.fq.gz using ID $ID..."
        gdown $ID --output "${SAMPLES_DIR}/${SAMPLE_NAME}.fq.gz"
    fi
done < $POPMAP
