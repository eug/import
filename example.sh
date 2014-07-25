#!/bin/bash

source yeash

use core/file.isdir
use core/string.to_lower
use core/string.to_upper as upper

if [ ! $(isdir "$1") ]; then
    echo $(to_lower "$1 YEASH!")
else
    echo $(upper "$1 yeash!")
fi
