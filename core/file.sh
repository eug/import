#!/bin/bash


# return True if file exist
# $1 file
function exist
{
  echo "-e $1"
}


# return True if file is a directory
# $1 directory
function isdir
{
  echo "-d $1"
}


# return True if file is a regular file
# $1 file
function isfile
{
  echo "-f $1"
}

# return True if file is a symbolic link
# $1 file
function islink
{
  echo "-L $1"
}


# return True if file is a file readable
# $1 file
function can_read
{
  echo "-r $1"
}


# return True if file is a file writable
# $1 file
function can_write
{
  echo "-w $1"
}


# return True if file is a file executable
# $1 file
function can_execute
{
  echo "-x $1"
}


# return True if file1 is newer than file2
# {Note} According to modification time
# $1 file1
# $2 file2
function newer_than
{
  echo "$1 -ot $2"
}


# return True if file1 is older than file2
# {Note} According to modification time
# $1 file1
# $2 file2
function older_than
{
  echo "$1 -ot $2"
}


# return the number of lines
# $1 input file
function count_lines
{
  wc -l "$1"
}


# count the number of characters of a given file
# $1 input file
function count_chars
{
  wc -c "$1"
}


# count the number of words of a given file
# $1 input file
function count_words
{
  wc -w "$1"
}


# count the number of bytes of a given file
# $1 input file
function count_bytes
{
  wc -c "$1"
}


# count the frequency of a given word in some file
# $1 file
# $2 word
function count_word_freq
{
  grep -c "$2" "$1"
}


# read each line of a file and apply a function on each line
# $1 file
# $2 callback function
function read_each_line
{
  local file="$1"
  if [ -n "$2" ]; then local fn="$2"; else local fn="echo -e"; fi

  while read -r line; do
    $fn "$line"
  done < "$file"
}


# return a specific line of a file
# {Note} zero indexed
# $1 file
# $2 line number
function read_at_line
{
  local file="$1"
  local line=$(($2 + 1))

  sed -n "${line}p" "$file"
}


# overwrite a specific line of a file
# {Note} zero indexed
# $1 file
# $2 string to write
# $3 line number
function overwrite_at_line
{
  local file="$1"
  local string="$2"
  local line="$(($3 + 1))"

  sed -i "${line}s/.*/$string/" "$file"
}


# insert text at particular line
# {Note} zero indexed
# $1 file
# $2 string to write
# $3 line number
function insert_at_line
{
  local file="$1"
  local string="$2"
  local line="$(($3 + 1))"

  sed -i "${line}i $string" "$file"
}
