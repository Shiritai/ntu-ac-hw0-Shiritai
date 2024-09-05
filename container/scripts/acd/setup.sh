#!/bin/bash

script_dir=$(realpath $(dirname $0))

# install dependencies
sudo apt update -y && \
    sudo apt upgrade -y && \
    sudo apt install git curl unzip pipx -y

# setup shell (bash and zsh)
cp ${script_dir}/.acd.sh ~
_CMD=$(echo -e "\nsource ~/.acd.sh\n")
echo $_CMD >> ~/.bashrc
echo $_CMD >> ~/.zshrc

# install deno, flit, bril2xxx
mkdir -p ~/repos
BRIL_REPO=~/repos/bril
mkdir -p $BRIL_REPO
sudo git clone https://github.com/sampsyo/bril.git $BRIL_REPO
curl -fsSL https://deno.land/install.sh | sh

# temporary setup deno path
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

deno install ${BRIL_REPO}/brili.ts
pipx install flit
cd ${BRIL_REPO}/bril-txt && flit install --symlink
