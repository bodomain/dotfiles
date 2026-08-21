# Dotfiles

Focused configuration for Sway and Waybar. The files in this repository are
the source of truth; the corresponding paths below `~/.config` are symlinks.

## Install

Run:

```sh
./install.sh
```

The installer is safe to run repeatedly. It creates missing links and refuses
to overwrite regular files or symlinks that point somewhere else. Move or back
up conflicting files before running it on another machine.

The repository intentionally tracks only:

- `config/sway/config`
- `config/waybar/config.jsonc`
- `config/waybar/style.css`

Local files such as `config.old` and `config.jsonc.bak2` are not managed.
# dotfiles
