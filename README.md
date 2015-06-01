# import.sh
A import system for shell script.

## About
This project implements an import system for shell script, allowing to import specific functions and/or set alias for it. The current version only supports BASH, but can be easily extended for any alternative. Also, some guidelines must be followed to avoid possible conflicts during the usage.

## Basic usage
```import <module>[.function][ as <alias>]```

## Guidelines
- Each module _MUST_ _NOT_ have any dependency with other modules
- Private functions _MUST_ be prefixed with ```__``` (double underscore)
- Each public function _MUST_ depend only by private functions
- All modules _MUST_ contain ``.sh`` extension

## Example

```sh
#!/bin/bash

source ../import.sh

import core/file                     # import entire module
import core/string.to_lower          # import specific function
import core/string.to_upper as upper # import specific function and define an alias

if [ ! $(isdir "$1") ]; then
    echo $(to_lower "$1 IS NOT A DIRECTORY")
else
    echo $(upper "$1 is a directory")
fi

```
