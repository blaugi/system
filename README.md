# Home Manager Flake Setup 

Simple system config using [Nix Flakes](https://nixos.wiki/wiki/Flakes) and [Home Manager](https://nix-community.github.io/home-manager/).


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

For the initial installation:

```sh
nix run home-manager/master -- switch --flake .#headless 
```

Once Home Manager is installed, you can simply use:

```sh
home-manager switch --flake .#<profile>
```

Replace `<profile>` with either `headless` or `desktop` depending on your needs.

---
