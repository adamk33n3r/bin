#!/bin/bash

mkdir $HOME/.tmux/sessions -p

if [ $# -eq 0 ]; then
    session=$(basename $(pwd))
    CRD=$(pwd)
else
    if [ $# -gt 1 ]; then
        session=$1
        CRD=$(readlink -fn $2)
    else
        session=$(basename $1)
        CRD=$(readlink -fn $1)
    fi
fi
echo "Starting tmux from $CRD with session name $session"
echo $CRD > $HOME/.tmux/sessions/$session
echo $session > $HOME/.tmux/sessions/last
tmux -L $session new -s $session
