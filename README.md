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
| **Audio & Media** | PipeWire + `playerctl` + `songrec` | Global voice toggles & asynchronous audio recognition / stream capture (`SUPER + F4`) |

---

## Key Highlights

- **Distro-Agnostic:** Works on pure Arch, EndeavourOS, CachyOS, Fedora, or any modern Wayland distribution without vendor lock-in.
- **Raw Input Tracking:** Mouse acceleration is strictly disabled (`accel_profile = flat`) for 1:1 true hardware precision.
- **Layout-Independent Voice Controls:** Discord/Vesktop voice toggles use hardware keycodes (`code:105` for Right Ctrl, `code:62` for Right Shift) to work reliably across both US and Cyrillic layouts.
- **Quick Syscall Reference:** Integrated `sys <syscall>` function in Fish to extract the exact C synopsis without wading through 10-page man pages.
- **System-Wide Audio Recognition & Stream Archiver (`save-current-track`):** Bound to `SUPER + F4`. Instantly copies current media metadata to the Wayland clipboard, then asynchronously captures a 12-second `.mp3` sample directly from internet radio sockets or PipeWire's `@DEFAULT_SINK@.monitor` (supporting browsers, games, and offline players). Identifies the track via the Shazam API using `songrec`, updates the clipboard and desktop notification on match, appends entries to `~/Music/radio_gems.txt`, and archives uniquely timestamped audio clips in `~/Music/radio_captures/` with volume-based silence detection.

---

## Installation

Clone the repository and run the symlink installer:

```bash
git clone https://github.com/herabel/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

Optional runtime dependencies for `save-current-track`:

```bash
sudo pacman -S --needed ffmpeg playerctl jq libnotify wl-clipboard socat
paru -S songrec
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
