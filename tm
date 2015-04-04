#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Must pass at least name of session"
    exit 1
fi
session=$1
if [ $# -gt 1 ]; then
    CRD=$(readlink -fn $2)
else
    CRD=$(pwd)
fi
export CRD
echo "Starting tmux from $CRD with session name $session"
tmux new -s $session
