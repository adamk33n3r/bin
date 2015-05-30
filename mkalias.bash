#!/bin/bash

alias=$1
cmd=${*:2}
echo "Setting $alias to $cmd"
alias $alias=$cmd
echo "alias $alias=$cmd" >> $HOME/.config/fish/config.fish
