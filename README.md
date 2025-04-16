# Home Manager Setup (Non-Flake, Per-User)

This repository provides a minimal [Home Manager](https://nix-community.github.io/home-manager/) configuration _without_ Nix flakes.  
It installs and configures:

- [fish](https://fishshell.com/) (friendly interactive shell)
- [lazygit](https://github.com/jesseduffield/lazygit) (terminal UI for git)
- [bat](https://github.com/sharkdp/bat) (cat clone with syntax highlighting)
- [zoxide](https://github.com/ajeetdsouza/zoxide) (smarter cd command)
- [starship](https://starship.rs/) (prompt)
- [yazi](https://github.com/sxyazi/yazi) (blazing-fast terminal file manager)
- [eza](https://github.com/eza-community/eza) (modern replacement for `ls`)
- [CommitMono Nerd Font](https://www.nerdfonts.com/font-downloads) (monospace font with icons)

Your fish shell config (including conda and custom functions) is managed in a separate Nix file.

---

## Usage

### 1. Prerequisites

- Nix and [Home Manager](https://nix-community.github.io/home-manager/index.html#sec-install-standalone) installed (no flakes needed)
- This repo cloned or your files in `~/.config/nixpkgs/`

### 2. File Structure

```
.
├── home.nix
├── fish-extra.nix
└── README.md
```

- `home.nix`: main Home Manager configuration
- `fish-extra.nix`: your custom fish shell setup (sourced by `home.nix`)
- `README.md`: this file

### 3. Applying the Configuration

From this directory, run:

```sh
home-manager switch
```

If your Home Manager configuration is elsewhere (like `~/.config/nixpkgs/`), copy the files there and run the same command.

---

## Notes

- **Font:**  
  Make sure to set your terminal font to **CommitMono Nerd Font** for best results (glyphs/icons). This must be done via your terminal emulator's preferences.

- **Change Username/Path:**  
  If your username or home directory is different, edit the `home.username` and `home.homeDirectory` fields in `home.nix`.

- **Shell:**  
  To make fish your default shell, run:
  ```sh
  chsh -s $(which fish)
  ```

- **Extending:**  
  You can add more Home Manager [options](https://nix-community.github.io/home-manager/options.html) as needed.

---

## Updating for nixpkgs changes

If you see errors about font packages, update your `home.nix`'s font entry to use the new `pkgs.nerd-fonts.<font-name>` format, as is done here.

---
