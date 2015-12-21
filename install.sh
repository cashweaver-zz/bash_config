#!/usr/bin/env bash

HOME_PATH="/home/$(whoami)"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Installing bash_config"

echo "  Creating backups"
if [[ -f $HOME_PATH/.bash_aliases ]]; then
    mv $HOME_PATH/.bash_aliases $HOME_PATH/.bash_aliases.bak
    echo "    $HOME_PATH/.bash_aliases backed up to $HOME_PATH/.bash_aliases.bak"
fi
if [[ -f $HOME_PATH/.bashrc ]]; then
    mv $HOME_PATH/.bashrc $HOME_PATH/.bashrc.bak
    echo "    $HOME_PATH/.bashrc backed up to $HOME_PATH/.bashrc.bak"
fi

echo "  Creating symlinks"
ln -s $SCRIPT_DIR/.bash_aliases $HOME_PATH/.bash_aliases
ln -s $SCRIPT_DIR/.bashrc $HOME_PATH/.bashrc

echo "  Activating .bashrc"
source $HOME_PATH/.bashrc

echo "bash_config installation complete"
