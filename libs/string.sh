#!/bin/bash


# {Internal} check if a given string match a specific pattern
# {Note} True is 0 and 1 is False
# $1 string 
# $2 pattern 
function __grep_pattern
{
  echo "$1" | grep -q "$2"; echo "$?"
}


function isalnum
{
  __grep_pattern "$1" '[[:alnum:]]'
}


function isalpha
{
  __grep_pattern "$1" '[[:alpha:]]'
}


function islower 
{
  __grep_pattern "$1" '[[:lower:]]'
}


function isupper
{
  __grep_pattern "$1" '[[:upper:]]'
}


function isdigit
{
  __grep_pattern "$1" '[[:digit:]]'
}


function isxdigit
{
  __grep_pattern "$1" '[[:xdigit:]]'
}


function ispunct
{
  __grep_pattern "$1" '[[:punct:]]'
}


function isblank
{
  __grep_pattern "$1" '[[:blank:]]'
}


function isspace
{
  __grep_pattern "$1" '[[:space:]]'
}


function iscntrl
{
  __grep_pattern "$1" '[[:cntrl:]]'
}


function isprint
{
  __grep_pattern "$1" '[[:print:]]'
}


function isgraph
{
  __grep_pattern "$1" '[[:graph:]]'
}


# reverse a given string
# $1 input string
function reverse
{
  echo "$1" | rev
}


# escape all characters of a given string
# {Note} Avoid semicolon at the end of the string,
# this can be misinterpreted by bash
# $1 input string
function escape
{
  echo "$1" | sed -e 's/./\\&/g; 1!s/^/"/; $!s/$/"/'
}


# FIXME: remove complexity
# return the char at a given position of a string
# {Note} zero indexed
# $1 input string
# $2 char index
function char_at
{
  local string="$1"
  local index="$2"

  if [ ! -z "${string}" ]; then

    if [ "$index" -eq 0 ]; then
      echo "${string:0:1}"
    elif [ "$index" -eq 1 ]; then
      echo "${string:1:1}"
    else
      local length="${#string}"
      local start=$((length - 1))
      echo "${string:$start:$length}"
    fi

  fi
}


# return the first character of a given string
# $1 input string
function first_char
{
  char_at "$1" 0
}


# return the last character of a given string
# $1 input string
function last_char
{
  char_at "$1" "${#1}"
}


# revese the case of each character
# $1 input string
function reverse_case
{
  echo "$1" | tr '[A-Z][a-z]' '[a-z][A-Z]'
}


# convert all characters to lower case
# $1 input string
function to_lower
{
  echo "$1" | tr '[A-Z]' '[a-z]' 
}


# convert all characters to upper case
# $1 input string
function to_upper
{
  echo "$1" | tr '[a-z]' '[A-Z]'
}


# capitalize a given string
# {Note} Only works with space as delimiter
# $1 string to be capitalized
function to_capitalize
{
  read -ra words <<< "$1" && echo "${words[@]^}"
}


# split a given string using a delimiter
# $1 input string
# $2 delimiter
# $3 callback function for each element (Optional)
function split_each_field
{
  local string=(${1//$2/ })
  if [ -n "$3" ]; then local fn="$3"; else local fn="echo"; fi

  for word in "${string[@]}"; do
    $fn "$word"
  done
}


# replace a old string for a new one
# $1 string
# $2 old string
# $3 new string
function replace
{
  echo "$1" | sed "s/$2/$3/g"
}


# insert a string at specific location
# {Note} zero indexed
# $1 original string
# $2 string to add
# $3 index
function insert_at
{
  echo "$1" | sed "s/^\(.\{$3\}\)/\1$2/"
}


# merge blank spaces
# $1 input string
function merge_blank
{
  echo -e "$1" | awk '{ $1=$1 }{ print }' 
}
