#!/bin/sh

# get evtx files

/azcopy cp "$BLOB" /chainsaw/download/ --recursive=True >&2
