#!/bin/sh

if [ ! "$ZIP_URL" ] && [ ! "$BLOB" ]; then 
    printf \
     "Please run with blob or zip url \n'docker run -e (ZIP_URL=<zip_download_url>|BLOB=<blob_url>) nisse123/chainsaw'\n" 1>&2
    exit 1
else
    # Setup download folder and evtx_folder
    mkdir download evtx_files
fi

if [ "$ZIP_URL" ]; then
    /scripts/get_event_zip.sh
fi

if [ "$BLOB" ]; then
    /scripts/get_event_blob.sh
fi

find download/ -name *.evtx -exec mv {} /chainsaw/evtx_files/ \;

/scripts/run_chainsaw.sh

