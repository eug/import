# yeash
<b>Y</b>et anoth<b>e</b>r <b>A</b>bstraction for <b>Sh</b>ell

A module-based library providing standardized functions to help build large shell scripts.

## about

This project is module-based containing a set of functions to help build large shell scripts. In the core library, each shell script is called module, the collection of modules and functions can be easily reused among projects. One of the main features of this project is the ```use``` function which allows to import particular functions to scripts, or even better, set a alias for it.


## basic usage
- Bear in mind that ```use``` function is just a proof of concept.
- Use the command ```./spec <module.sh>``` to list which functions are available.
- To import a whole module you can use the old fashion ```source <module.sh>```
- To import a particular function just ```use <module>.[function][ as <alias>]```.


## guidelines
- Each module _MUST_ _NOT_ have any dependency with other modules
- Private functions _MUST_ be prefixed with ```__``` (double underscore)
- Each public function _MUST_ depend only by private functions


## example

```sh
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

```