#!/bin/bash

# show how long the system has been running
function uptime
{
  uptime -p | cut -d ' ' -f 2-
}


# {Internal} grep memory usage information
# $1 arguments to free command (Optional)
# $2 field to be printed
function __memory
{
  free "$@" | grep "Mem"
}


# $1 arguments to free command (Optional)
function total_memory
{
  __memory "$@" | awk '{ print $2 }'
}


# $1 arguments to free command (Optional)
function used_memory
{
  __memory "$@" | awk '{ print $3 }'
}


# $1 arguments to free command (Optional)
function free_memory
{
  __memory "$@" | awk '{ print $4 }'
}


# {Internal} grep disc usage informations
# $1 arguments to df command (Optional)
function __disc
{
  df "$@" | grep "^/dev/"
}


# $1 arguments to df command (Optional)
function total_disc
{
  __disc "$@" | awk '{ print $1"\t"$2 }'
}


# $1 arguments to df command (Optional)
function used_disc
{
  __disc "$@" | awk '{ print $1"\t"$3 }'
}


# $1 arguments to df command (Optional)
function free_disc
{
  __disc "$@" | awk '{ print $1"\t"$4 }'
}
