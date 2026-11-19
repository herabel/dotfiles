#!/usr/bin/env bash
# install.sh — Setup symlinks for herabel's dotfiles
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
BIN_DIR="$HOME/.local/bin"

echo "==> Deploying dotfiles from $DOTFILES_DIR"

mkdir -p "$CONFIG_DIR" "$BIN_DIR" "$HOME/Music/radio_captures"

link_item() {
    local src="$1"
    local dst="$2"

    if [ -L "$dst" ]; then
        echo "  [relink] $dst -> $src"
        rm -f "$dst"
    elif [ -e "$dst" ]; then
        echo "  [backup] $dst -> ${dst}.bak"
        mv "$dst" "${dst}.bak"
    else
        echo "  [link]   $dst -> $src"
    fi

    mkdir -p "$(dirname "$dst")"
    ln -s "$src" "$dst"
}

# 1. Configs
link_item "$DOTFILES_DIR/.config/nvim"   "$CONFIG_DIR/nvim"
link_item "$DOTFILES_DIR/.config/fish"   "$CONFIG_DIR/fish"
link_item "$DOTFILES_DIR/.config/kitty"  "$CONFIG_DIR/kitty"
link_item "$DOTFILES_DIR/.config/hypr/hyprland.conf" "$CONFIG_DIR/hypr/hyprland.conf"

# 2. Local Binaries & Scripts
for script in "$DOTFILES_DIR/.local/bin"/*; do
    if [ -f "$script" ]; then
        chmod +x "$script"
        link_item "$script" "$BIN_DIR/$(basename "$script")"
    fi
done

# 3. Git config
link_item "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"

# 4. Dependency check for system tools (save-current-track)
echo "==> Checking runtime dependencies for tools..."
missing_pkgs=()
for cmd in ffmpeg songrec playerctl jq wl-copy notify-send socat; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        missing_pkgs+=("$cmd")
    fi
done

if [ ${#missing_pkgs[@]} -gt 0 ]; then
    echo "  [warn] Missing tools: ${missing_pkgs[*]}"
    echo "  [hint] Arch install: sudo pacman -S --needed ffmpeg playerctl jq libnotify wl-clipboard socat && paru -S songrec"
else
    echo "  [ok]   All runtime dependencies are installed!"
fi

echo "==> Dotfiles deployed successfully!"
