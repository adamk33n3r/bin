#!/bin/bash

if [ $# -eq 2 ]; then
    systemctl status $1 --user
else
    sudo systemctl status $1
fi
