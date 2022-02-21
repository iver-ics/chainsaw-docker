#!/bin/sh

/chainsaw/chainsaw hunt -j /chainsaw/evtx_files \
    --rules /chainsaw/sigma_rules/ \
    --mapping /chainsaw/mapping_files/sigma-mapping.yml \
    | /jq -c '.[]'
