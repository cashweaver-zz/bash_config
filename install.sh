#!/usr/bin/env bash

echo "Installing bash_config"

echo "  Creating backups"
if [[ ! -f .bash_aliases ]]; then
    mv .bash_aliases .bash_aliases.bak
    echo "    .bash_aliases backed up to .bash_aliases.bak"
fi
if [[ ! -f .bashrc ]]; then
    mv .bashrc .bashrc.bak
    echo "    .bashrc backed up to .bashrc.bak"
fi

echo "  Linking to bash_config"
ln -s bash_config/.bash_aliases .bash_aliases
ln -s bash_config/.bashrc .bashrc

echo "bash_config installed successfully!
