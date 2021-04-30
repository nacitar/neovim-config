#!/bin/bash

nvim_path="$(type -P nvim)"
if [[ -x "$nvim_path" ]]; then
    "$nvim_path" "$@"
else
    echo "nvim isn't available in PATH." 1>&2
    exit 1
fi
