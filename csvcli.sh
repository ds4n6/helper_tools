#!/bin/bash

# Small script that allows you to visualize "simple" csv files in the terminal

    cat $1 | \
    awk -F'"' -v OFS='' '{ for (i=2; i<=NF ; i+=2 ) gsub(",","%-%",$i) } 1'  | \
    sed 's/,/|/g' | sed -e 's/|\ */|/g' -e 's/\ *|/|/g' -e 's/||/| |/g' -e 's/||/| |/g' | \
    column -s\| -t | \
    sed 's/%-%/,/g' | \
    sed 's/,,/, ,/g' | \
    less -#40 -N -S -R
