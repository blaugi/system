# Home Manager Flake Setup 

This repository provides a modular, multi-system mapping tailored for advanced CLI productivity using [Nix Flakes](https://nixos.wiki/wiki/Flakes) and [Home Manager](https://nix-community.github.io/home-manager/).

## 🔎 fzf (Fuzzy Finding)

Deep shell integration combined with `fd` and `bat` makes navigating instant.

- <kbd>Ctrl</kbd>+<kbd>t</kbd> → Fuzzy find files anywhere in your directory.
- <kbd>Ctrl</kbd>+<kbd>r</kbd> → Instantly filter and search through shell history.
- <kbd>Alt</kbd>+<kbd>c</kbd> → Fast-jump into any subdirectory tree.

## Usage

### 1. Prerequisites

- [Nix](https://nixos.org/download) installed natively.
- Flakes must be enabled in your setup.

### 2. File Structure

```
.
├── flake.nix                 # Unified entry point for multi-user/multi-system configurations
├── home/                     
│   ├── default.nix           # Imports the targeted user's module stack
│   └── modules/              
│       ├── dev/default.nix   # Build stacks (Python, uv, Rust, Go)
│       ├── shell/fish.nix    # Deep integrations for Zoxide, Fzf, Direnv
│       ├── theme/default.nix # Universal Stylix configuration block
│       └── tools/            # CLI utilities and standard Git integrations
└── README.md
```

### 3. Applying the Configuration

Deploy the Home Manager profile defined in `flake.nix` by pointing to the specific user build (e.g. `azureuser`):

```sh
nix run home-manager/master -- switch --flake .#azureuser
```

---

## Notes

- **Font:**  
  Stylix explicitly maps the system to **CommitMono Nerd Font**. Make sure your graphical host terminal emulator binds its internal text rendering to "CommitMono Nerd Font".
- **Dynamic User Mapping:**  
 Simply clone the target block in `flake.nix` and pass a new `username` and `homeDirectory`.
