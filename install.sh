#!/usr/bin/env bash

FILE=/etc/docker

if [ ! -f "$FILE" ]; then
    echo "$FILE does not exist."
fi
