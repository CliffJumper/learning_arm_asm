#!/bin/bash

FNAME="$(basename "$1" | sed 's/\(.*\)\..*/\1/')"

as -o $FNAME.o $1 && ld -o $FNAME $FNAME.o
