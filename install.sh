#!/bin/sh

set -eu

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

install_link() {
    source_path=$1
    destination_path=$2

    mkdir -p "$(dirname -- "$destination_path")"

    if [ -L "$destination_path" ]; then
        if [ "$(readlink "$destination_path")" = "$source_path" ]; then
            printf 'Already linked: %s\n' "$destination_path"
            return
        fi

        printf 'Refusing to replace conflicting symlink: %s\n' "$destination_path" >&2
        exit 1
    fi

    if [ -e "$destination_path" ]; then
        printf 'Refusing to replace existing path: %s\n' "$destination_path" >&2
        exit 1
    fi

    ln -s "$source_path" "$destination_path"
    printf 'Linked: %s -> %s\n' "$destination_path" "$source_path"
}

install_link "$repo_dir/config/sway/config" "$HOME/.config/sway/config"
install_link "$repo_dir/config/waybar/config.jsonc" "$HOME/.config/waybar/config.jsonc"
install_link "$repo_dir/config/waybar/style.css" "$HOME/.config/waybar/style.css"
