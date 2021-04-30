#!/bin/bash

nvim_path="$(command -v nvim)"
if [[ -n "$nvim_path" ]]; then
    "$nvim_path" "$@"
else
    echo "nvim isn't available in PATH." 1>&2
    exit 1
fi
