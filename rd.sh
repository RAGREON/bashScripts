#!/bin/bash

function list_all() {
    local root_directory=$1

    if [ "${root_directory: -1}" = "/" ]; then
        root_directory=${root_directory%?}
        echo $root_directory
    fi

    for item in $root_directory/*; do
        if [ -d $item ]; then
            echo "$item is a directory."

            if [ -z "$(ls -A "$item")" ]; then
                rmdir $item
                echo "removed directory: $item"
            else
                list_all $item
            fi

        else
            rm $item
            echo "removed file: $item"
        fi
    done

    rmdir $root_directory
    echo "successfully removed directory: $root_directory"
}

list_all $1