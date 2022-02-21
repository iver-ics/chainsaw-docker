#!/bin/sh

# get evtx files

wget "$ZIP_URL" \
    --output-document=download/download.zip >&2

unzip download/download.zip -d download/ >&2
