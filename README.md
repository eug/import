
# yeash
**Ye**t another **A**bstraction for **Sh**ell

yeash can be seen as a set of modules, set of snippets, wrapper functions, you name it. This project aims to collect the most popular functions of shell script world, being able to reuse, extend in a easy and readable way.

## basic usage
- Use the command ```./spec <module.sh>``` to see which functions are available.

- To import a whole module you can use the old fashion ```source <module.sh>```

- Or you can import a particular function of a given module to your script just using ```include <module>.[function][ as <alias>]```, make sure to import the ```include``` module before to use it. Bear in mind that the ```include``` function is just a proof of concept.


## example

```sh
#!/bin/bash

source include

include file.isdir
include string.to_lower
include string.to_upper as upper

if [ $(isdir "$1") ]; then
    echo $(to_lower "$1")
else
    echo $(upper "$1")
fi

```

