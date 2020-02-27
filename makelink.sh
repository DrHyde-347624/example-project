#!/bin/bash

function help {
    echo provide two arguments
}

if [ "$#" != "2" ]; then
    help
else
    touch $1
    ln -s $1 $2
fi
