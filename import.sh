#!/bin/bash

# Loads all private functions of a given module
# $1 module name
_load_private_functions()
{
  sed -n "/^_[A-Za-z0-9_]+()/,/^}/p" "${1}.sh" 
}


# Loads a public function of a particular module
# $1 module name
# $2 function name
_load_public_functions()
{
  local pattern0="\(function $2\ *{\?$\)"
  local pattern1="\(^$2()\ *{\?$\)"

  sed -n "/\($pattern0\|$pattern1\)/,/^}/p" "${1}.sh"
}


_isloaded()
{
  echo "declare -F $1 > /dev/null; echo $?"
}


# usage: use <module>.[function][ as <alias>]
# $1 name of the module/function to include
# $2 the 'as' "keyword"
# $3 function alias
import()
{
  local arg=(${1//./ })
  local module="${arg[0]}"
  local func="${arg[1]}"
  local alias="$3"

  # check if a function is specified 
  if [ -n "${func}" ]; then

    local pvt_func="$(_load_private_functions ${module})"
    local pbl_func="$(_load_public_functions  ${module} ${func})"

    # check if a alias was specified
    if [ "$2" = "as" -a -n "${alias}" ]; then
      pbl_func="${pbl_func//$func/$alias}"
    fi

    eval "$pvt_func"
    eval "$pbl_func"

    if [ "$(_isloaded $func)" = "$(_isloaded $alias)" ]; then
      echo "unable to load function: $func" 1>&2
      exit
    fi
    
  else
    # loads the entire module
    source "${module}.sh"
  fi
}