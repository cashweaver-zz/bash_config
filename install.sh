#!/usr/bin/env bash

HOME_PATH="/home/$(whoami)"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Installing bash configuration"

echo "  Reorganizing existing bashrc and bash_alias files"
if [[ -f $HOME_PATH/.bash_aliases ]]; then
  if [[ -f $HOME_PATH/.bash_aliases.local ]]; then
    mv $HOME_PATH/.bash_aliases.local $HOME_PATH/.bash_aliases.local.bak
    echo "    $HOME_PATH/.bash_aliases.local backed up to $HOME_PATH/.bash_aliases.local.bak"
  fi

  mv $HOME_PATH/.bash_aliases $HOME_PATH/.bash_aliases.local
  echo "    $HOME_PATH/.bash_aliases moved up to $HOME_PATH/.bash_aliases.local"
fi
if [[ -f $HOME_PATH/.bashrc ]]; then
  mv $HOME_PATH/.bashrc $HOME_PATH/.bashrc.bak
  echo "    $HOME_PATH/.bashrc backed up to $HOME_PATH/.bashrc.bak"
fi

echo "  Creating symlinks"
ln -s $SCRIPT_DIR/.bash_aliases $HOME_PATH/.bash_aliases
ln -s $SCRIPT_DIR/.bashrc $HOME_PATH/.bashrc

echo "bash_config installation complete"
