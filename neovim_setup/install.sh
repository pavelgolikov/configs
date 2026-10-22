#!/usr/bin/env bash
#
# Neovim setup for Python: a file explorer (nvim-tree, like NERDTree) and
# go-to-definition / find-uses (the pyright language server).
#
# HOW TO USE
#   1. Copy this whole neovim_setup directory to the machine.
#   2. If curl or git are missing, install them first:
#        sudo apt install curl git
#   3. Run:  bash neovim_setup/install.sh
#   4. If `nvim` is not found afterwards, open a new terminal (Ubuntu adds
#      ~/.local/bin to PATH at login once that directory exists).
#   5. Run:  nvim
#
# WHAT IT DOES (nothing needs sudo; everything goes into your home directory)
#   - Installs Neovim v0.12.6 into ~/.local/opt and links it as ~/.local/bin/nvim.
#   - Installs Node.js v24.22.1 (which includes npm) into ~/.local/opt and links
#     it as ~/.local/bin/node. Pyright is written in JavaScript and runs on it.
#   - Installs pyright with that npm into ~/.local (~/.local/bin/pyright-langserver).
#   - Copies nvim/ (init.lua and the plugin lockfile) to ~/.config/nvim.
#   - Starts Neovim once without a window so it downloads the plugins.
#
# USING IT
#   File explorer (opens on the left when Neovim starts):
#     :NvimTreeToggle     show / hide it        :NvimTreeFindFile   reveal current file
#     Enter or o          open file / folder    Ctrl-t              open in new tab
#     Ctrl-v / Ctrl-x     open in v/h split     Backspace           close folder
#     a / d / r           create / delete / rename (end the name with / for a folder)
#     H                   show / hide dotfiles  g?                  list all keys
#   Python code (the language server starts by itself in .py files):
#     Ctrl-]              go to definition      Ctrl-t or Ctrl-o    jump back
#     grr                 list all uses in the quickfix window (Enter jumps to one)
#     K                   show type / docs      grn                 rename everywhere
#   Activate your conda env or virtualenv before starting nvim, so pyright
#   can find the packages your code imports.

set -euo pipefail
cd "$(dirname "$0")"

mkdir -p ~/.local/opt ~/.local/bin
curl -fL https://github.com/neovim/neovim/releases/download/v0.12.6/nvim-linux-x86_64.tar.gz | tar -xz -C ~/.local/opt
ln -sf ~/.local/opt/nvim-linux-x86_64/bin/nvim ~/.local/bin/nvim

curl -fL https://nodejs.org/dist/v24.22.1/node-v24.22.1-linux-x64.tar.gz | tar -xz -C ~/.local/opt
ln -sf ~/.local/opt/node-v24.22.1-linux-x64/bin/node ~/.local/bin/node

# npm finds node through PATH, and ~/.local/bin may not be on PATH until the next login.
export PATH="$HOME/.local/bin:$PATH"
~/.local/opt/node-v24.22.1-linux-x64/bin/npm install -g --prefix ~/.local pyright

mkdir -p ~/.config/nvim
cp -rT nvim ~/.config/nvim

~/.local/bin/nvim --headless +qa
