#!/bin/bash

script_dir=$(realpath $(dirname $0))

# install dependencies
install_if_dne git curl unzip pip

# setup shell (bash and zsh)
cp ${script_dir}/.acd.sh ~
_CMD=$(echo -e "\nsource ~/.acd.sh\n")
echo $_CMD >> ~/.bashrc
echo $_CMD >> ~/.zshrc
source ~/.acd.sh

# prepare repo for installation
mkdir -p ~/repos
BRIL_REPO=~/repos/bril
mkdir -p $BRIL_REPO
sudo git clone https://github.com/sampsyo/bril.git $BRIL_REPO

# install deno and brili
print_info "Install Deno"
curl -fsSL https://deno.land/install.sh | sh
print_info "Install brili"
deno install -g ${BRIL_REPO}/brili.ts

# install flit and bril2xxx
pip install --user flit
cd ${BRIL_REPO}/bril-txt && flit install --symlink --user

# install needed packages
pip install click tomlkit

# install TypeScript-to-Bril Compiler & brilck
deno install -g --allow-env --allow-read ts2bril.ts
deno install -g --allow-env --allow-read brilck.ts

# install hyperfine
sudo wget https://github.com/sharkdp/hyperfine/releases/download/v1.16.1/hyperfine_1.16.1_amd64.deb
sudo dpkg -i hyperfine_1.16.1_amd64.deb
