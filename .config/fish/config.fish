# ~/.config/fish/config.fish
# Portable Fish Shell Configuration for herabel

# ── Paths & Environment ──────────────────────────────────────────
if test -d $HOME/.local/bin
    fish_add_path $HOME/.local/bin
end

if test -d $HOME/.cargo/bin
    fish_add_path $HOME/.cargo/bin
end

set -gx GOBIN $HOME/.local/bin
set -gx CARGO_INSTALL_ROOT $HOME/.local
set -q EDITOR; or set -gx EDITOR nvim
set -q VISUAL; or set -gx VISUAL nvim

# ── Interactive Shell ────────────────────────────────────────────
if status is-interactive
    set -g fish_greeting

    # Aliases
    alias v="nvim"
    alias vim="nvim"
    alias g="git"
    alias lg="lazygit"
    alias ll="eza -la --icons --group-directories-first 2>/dev/null || ls -la"
    alias l="eza -l --icons --group-directories-first 2>/dev/null || ls -l"

    # Fast Syscall Reference helper
    function sys
        man -s 2 $argv[1] | sed -n '/SYNOPSIS/,/DESCRIPTION/p'
    end

    # Fastfetch on open if available
    if command -q fastfetch
        fastfetch
    end

    # Starship Prompt
    if command -q starship
        starship init fish | source
    end
end
