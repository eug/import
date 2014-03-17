#!/bin/bash


function isroot
{
  "$UID -eq 0";
}


# return all files that a program needs to launch
# $1 command
function dependencies
{
  local location=$(whereis $1 | awk '{ print $2 }')

  (\
   strace "$location" 2>&1 | grep "^open(" | sed 's/.*\"\(.*\)\".*/\1/g';\
   ldd "$location" | grep "=>" | awk '{ print $3 }';\
  ) | sort | uniq
}


# extract the most common compressed file types
# $1 compressed file path
function extract
{
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2) tar xvjf "$1"  ;;
      *.tar.gz ) tar xvzf "$1"  ;;
      *.bz2    ) bunzip2  "$1"  ;;
      *.rar    ) unrar x  "$1"  ;;
      *.gz     ) gunzip   "$1"  ;;
      *.tar    ) tar xvf  "$1"  ;;
      *.tbz2   ) tar xvjf "$1"  ;;
      *.tgz    ) tar xvzf "$1"  ;;
      *.zip    ) unzip    "$1"  ;;
      *.7z     ) 7z x     "$1"  ;;
      *.Z      ) uncompress "$1";;
      *)       echo "Error: '$1' unable to extract file" ;;
    esac
  else
    echo "Error: '$1' is not a valid file"
  fi
}


# $1 directory
function ls_octal
{
  stat -c "%a %n" "$@"
}


# $1 directory
function ls_sizes
{
  du -khs "$@" | sort -n
}

