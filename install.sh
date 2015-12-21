#!/usr/bin/env bash

HOME_PATH="/home/$(whoami)"
CWD=$(pwd)

echo "Installing bash_config"

echo "  Creating backups"
if [[ ! -f $HOME_PATH/.bash_aliases ]]; then
    mv $HOME_PATH/.bash_aliases $HOME_PATH/.bash_aliases.bak
    echo "    $HOME_PATH/.bash_aliases backed up to $HOME_PATH/.bash_aliases.bak"
fi
if [[ ! -f $HOME_PATH/.bashrc ]]; then
    mv $HOME_PATH/.bashrc $HOME_PATH/.bashrc.bak
    echo "    $HOME_PATH/.bashrc backed up to $HOME_PATH/.bashrc.bak"
fi

echo "  Creating symlinks"
ln -s $CWD/.bash_aliases $HOME_PATH/.bash_aliases
ln -s $CWD/.bashrc $HOME_PATH/.bashrc

echo "bash_config installation complete"
