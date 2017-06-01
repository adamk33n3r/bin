#!/bin/bash

mkdir $HOME/.tmux/sockets -p

if [ $# -eq 0 ]; then
    session=$(basename $(pwd))
    CRD=$(pwd)
else
    if [ $# -gt 1 ]; then
        session=$2
        CRD=$(readlink -fn $1)
    else
        session=$(basename $1)
        CRD=$(readlink -fn $1)
    fi
fi

# Check if session already exists
if [ -S ~/.tmux/sockets/$session ]; then
    echo "socket exists"
    if tmux -S ~/.tmux/sockets/$session has -t $session 2> /dev/null; then
        # It does, attach
        echo "attaching"
        echo $session > $HOME/.tmux/last
        tmux -S ~/.tmux/sockets/$session attach
        exit
    fi
fi
# It doesn't, create a new one
echo "Starting tmux from $CRD with session name $session"
#echo $CRD > $HOME/.tmux/sessions/$session
echo $session > $HOME/.tmux/last

tmux -S $HOME/.tmux/sockets/$session new -s $session -d
tmux -S $HOME/.tmux/sockets/$session send-keys cd Enter 
tmux -S $HOME/.tmux/sockets/$session attach
cleantmux
