#!/bin/bash

# compiler course settings
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$(pipx list | grep venv | grep $HOME | sed 's/.* //')/flit/bin:$PATH"
