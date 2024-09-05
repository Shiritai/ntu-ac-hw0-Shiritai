#!/bin/bash

# TODO: Add the commands to install the Bril environment tools.
# Make sure your script installs Deno, Flit, and the Bril tools.
# Ensure the script works on any machine and sets up the PATH correctly.
script_dir=$(realpath $(dirname $0))

cp ${script_dir}/container/scripts/acd/.acd.sh ~
_CMD=$(echo -e "\nsource ~/.acd.sh\n")
echo $_CMD >> ~/.bashrc
echo $_CMD >> ~/.zshrc

# install brili
BRIL_REPO=$script_dir/bril
deno install ${BRIL_REPO}/brili.ts

# install flit and bril2xxx
pip install --user flit
cd ${BRIL_REPO}/bril-txt && flit install --symlink --user
