# neovim-config

Installation:
```bash
config_dir="$HOME/.config/nvim"
rm -rf "$config_dir"
mkdir -p "$config_dir"
git clone "https://github.com/nacitar/neovim-config.git" "$config_dir"
```

If you want vim and vimdiff to forward to neovim, running this command will
create a $HOME/bin if necessary and put symlinks to forwarding scripts there.
It is the job of the user's bashrc to put this directory in $PATH.

This change is *RECOMMENDED*, because this also makes things like 'sudo vim'
work whereas an alias for vim wouldn't work in sudo.
```bash
config_dir="$HOME/.config/nvim"
"$config_dir/install_home_bin_forwarder.sh"
