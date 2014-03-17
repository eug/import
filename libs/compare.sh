#!/bin/bash


# return True if string is empty
# $1 string
function isempty
{
  echo "-z $1"
}


# return True if string is not empty
# $1 string
function not_empty
{
  echo "-n $1"
}


# {Internal} check if the given string
# has only digits and eliminate dependency with string.sh
# $1 input string
function __isdigit
{
  echo "$1" | grep -q '[[:digit:]]'; echo "$?"
}


# {Internal} check if both arguments are digits
# $1 string or number
# $2 string or number
function __are_both_digits
{
  [ $(__isdigit "$1") -eq 0 -a $(__isdigit "$2") -eq 0 ]
}


# return True if string1 equals string2
# $1 string or number
# $2 string or number
function equals
{
  if __are_both_digits "$1" "$2"; then
    echo "$1 -eq $2";
  else
    echo "$1 ==  $2";
  fi
}


# return True if string1 does not equal string2
# $1 string or number
# $2 string or number
function not_equals
{
  if __are_both_digits "$1" "$2"; then
    echo "$1 -ne $2";
  else
    echo "$1 !=  $2";
  fi
}


# return True, if the first integer is less than second one
# $1 string or number
# $2 string or number
function less_than
{
  if __are_both_digits "$1" "$2"; then
    echo "$1 -lt $2";
  else
    echo "$1 \<  $2";
  fi
}


# return True, if the first integer is greater than second one
# $1 string or number
# $2 string or number
function greater_than
{
  if __are_both_digits "$1" "$2"; then
    echo "$1 -gt $2";
  else
    echo "$1 \>  $2";
  fi
}


# return True, if the first integer is less than or equal second one
# $1 string or number
# $2 string or number
function less_or_equal
{
  echo "$1 -le $2"
}


# return True, if the first integer is greater than or equal second one
# $1 string or number
# $2 string or number
function greater_or_equal
{
  echo "$1 -ge $2"
}