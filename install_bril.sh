#!/bin/bash

# TODO: Add the commands to install the Bril environment tools.
# Make sure your script installs Deno, Flit, and the Bril tools.
# Ensure the script works on any machine and sets up the PATH correctly.
script_dir=$(realpath $(dirname $0))

$script_dir/container/scripts/acd/setup.sh
