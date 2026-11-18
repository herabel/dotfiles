# dotfiles

Personal, portable, and distro-agnostic workstation configurations for **Linux / Wayland**.

Designed for clean systems programming (Rust, Go), low-latency gaming, and a minimalist keyboard-driven workflow.

---

## Architecture & Stack

| Component | Tool | Description |
| :--- | :--- | :--- |
| **Compositor** | [Hyprland](https://hyprland.org) | Dynamic tiling Wayland compositor with raw mouse input & hardware binds |
| **Editor** | [Neovim](https://neovim.io) | Fast native LSP setup for `rust-analyzer` and `gopls`, Lazy plugin manager |
| **Terminal** | [Kitty](https://sw.kovidgoyal.net/kitty/) | GPU-accelerated terminal with SpaceMono Nerd Font |
| **Shell** | [Fish](https://fishshell.com) | Starship prompt, fast navigation aliases, instant syscall synopsis helper (`sys`) |
| **Audio & Media** | PipeWire + `playerctl` | Global shortcuts for Discord mute/deafen and current track logging |

---

## Key Highlights

- **Distro-Agnostic:** Works on pure Arch, EndeavourOS, CachyOS, Fedora, or any modern Wayland distribution without vendor lock-in.
- **Raw Input Tracking:** Mouse acceleration is strictly disabled (`accel_profile = flat`) for 1:1 true hardware precision.
- **Layout-Independent Voice Controls:** Discord/Vesktop voice toggles use hardware keycodes (`code:105` for Right Ctrl, `code:62` for Right Shift) to work reliably across both US and Cyrillic layouts.
- **Quick Syscall Reference:** Integrated `sys <syscall>` function in Fish to extract the exact C synopsis without wading through 10-page man pages.
- **Media Logger:** `save-current-track` copies currently playing audio metadata to the clipboard and appends it to `~/Music/radio_gems.txt`.

---

## Installation

Clone the repository and run the symlink installer:

```bash
git clone https://github.com/herabel/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

---

## Structure

```text
dotfiles/
├── .config/
│   ├── nvim/             # Neovim (native LSP, Rust, Go, formatting)
│   ├── hypr/             # Universal hyprland.conf (tiling, input, keybinds)
│   ├── fish/             # Fish shell configuration & aliases
│   └── kitty/            # Terminal configuration & theme
├── .local/bin/           # Helper scripts (save-current-track)
├── .gitconfig            # Git configuration
├── install.sh            # Safe symlink deployment script
└── README.md
```
