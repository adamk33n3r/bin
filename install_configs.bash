set -x
cp -r .vim/ ~/
cp .vimrc .gitconfig .bash* ~/
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
mv git-completion.bash ~/.git-completion.bash

. ~/.bashrc
