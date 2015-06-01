#!/bin/bash

source ../import.sh

import core/file.isdir
import core/string.to_lower
import core/string.to_upper as upper

if [ ! $(isdir "$1") ]; then
    echo $(to_lower "$1 YEASH!")
else
    echo $(upper "$1 yeash!")
fi
