#!/bin/bash


# Print a ERROR message (red color)
# $1 message
err()
{
  echo -e "\033[31mError:\033[0m $1"; exit;
}


# Print a WARNING message (yellow color)
# $1 message
warn()
{
  echo -e "\033[33mWarn :\033[0m $1";
}


# Print a INFO message (blue color)
# $1 message
info()
{
  echo -e "\033[34mInfo :\033[0m $1";
}