#!/bin/bash

source yeash

include libs/file.isdir
include libs/string.to_lower
include libs/string.to_upper as upper

if [ ! $(isdir "$1") ]; then
    echo $(to_lower "$1 YEASH!")
else
    echo $(upper "$1 yeash!")
fi
