#!/usr/bin/env bash

set -e

: ${DATA_DIR:=/home/server2/datasets/hi_fi_tts_v0}
: ${LIST_FILE:=filelists/Cori_Samuel_audio_text.txt filelists/John_Van_Stan_audio_text.txt filelists/Phil_Benson_audio_text.txt}
: ${ARGS="--extract-mels"}

python3 prepare_dataset.py \
    --wav-text-filelists $LIST_FILE \
    --n-workers 16 \
    --batch-size 1 \
    --dataset-path $DATA_DIR \
    --extract-pitch \
    --f0-method pyin \
    --n-speakers 4 \
    $ARGS
