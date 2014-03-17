#!/bin/bash

if [ -n "$1" ]; then
  grep "^function\ [^__]" "$1"
fi