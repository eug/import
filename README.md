
# yeash
**Ye**t another **A**bstraction for **Sh**ell

A new approach for modularization and abstractions of shell scripts, being able to reuse, extend in an easy and readable way.


# about

This project can be seen as a set of modules, set of snippets, wrapper functions, you name it. One of the main features of this project is the ```include``` command which allows to import particular functions to your scripts, or even better, rename the imported function using the ```as``` paramter. The collection of modules and functions can be easly reused, there is no need to include yeash to your project, just copy and paste!


## basic usage
- Use the command ```./spec <module.sh>``` to see which functions are available.

- To import a whole module you can use the old fashion ```source <module.sh>```

- Or you can import a particular function of a given module to your script just using ```include <module>.[function][ as <alias>]```, make sure to import the ```include``` module before to use it. Bear in mind that the ```include``` function is just a proof of concept.


## example

```sh
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

```

