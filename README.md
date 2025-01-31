# neovim-config

Installation:
```bash
config_dir="$HOME/.config/nvim"
rm -rf "$config_dir"
mkdir -p "$config_dir"
git clone "https://github.com/nacitar/neovim-config.git" "$config_dir"
```

If you want vi, vim, and vimdiff to forward to neovim, put something like this
into your bashrc:
```bash
if type -p nvim &>/dev/null; then
    alias vi='nvim'
    alias vim='nvim'
    alias vimdiff='nvim -d'
fi
```
In order to ensure this also works via sudo, you can include a trailing space
in an alias for sudo:
```bash
alias sudo='sudo '
```
The space is not meaningless; it informs bash to allow alias expansion on the
next token, allowing your aliases to work through sudo.
