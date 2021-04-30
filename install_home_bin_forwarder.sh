#!/bin/bash
script_path="$(realpath "${BASH_SOURCE[0]}")"
script_directory="${script_path%/*}"

bin_dir="$HOME/bin"
if [[ ! -d "$bin_dir" ]]; then
    mkdir "$bin_dir"
fi

nvim_forwarder="${script_directory}/forward_to_nvim.sh"
vim_symlink="$bin_dir/vim"
if [[ ! -e "$vim_symlink" ]]; then
    ln -s "$nvim_forwarder" "$vim_symlink"
fi

nvimdiff_forwarder="${script_directory}/forward_to_nvimdiff.sh"
vimdiff_symlink="$bin_dir/vimdiff"
if [[ ! -e "$vimdiff_symlink" ]]; then
    ln -s "$nvimdiff_forwarder" "$vimdiff_symlink"
fi
