#!/bin/bash

mkdir $HOME/.tmux/sessions -p

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
echo $CRD
export CRD
echo "Starting tmux from $CRD with session name $session"
echo $CRD > $HOME/.tmux/sessions/$session
echo $CRD > $HOME/.tmux/sessions/last
tmux new -s $session
