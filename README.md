# Home Manager Setup 

This repository provides a minimal [Home Manager](https://nix-community.github.io/home-manager/).

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

