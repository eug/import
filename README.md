# import.sh
An import system for shell script.

## About
This project implements an import system for shell script, allowing to import specific functions and set alias for it. The current version only supports BASH, but it can be easily extended for any alternative. Also, some guidelines must be followed to avoid possible conflicts during the usage.

## Basic usage
```import <module>[.function][ as <alias>]```

## Guidelines
- Each module **must not** have any dependency with other modules
- Private functions **must** be prefixed with ```__``` (double underscore)
- Each public function **must** depend only by private functions
- All modules **must** contain ``.sh`` extension

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
