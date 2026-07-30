# Home Manager Flake Setup

Personal system config using [Nix Flakes](https://nixos.wiki/wiki/Flakes), [flake-parts](https://flake.parts/), [Home Manager](https://nix-community.github.io/home-manager/), and [den](https://github.com/denful/den).

## Structure

```
flake.nix
└── modules/
    ├── homes.nix               # User/host definitions (vm, laptop, desktop)
    └── aspects/
        ├── desktop.nix
        ├── fonts.nix
        ├── vm.nix
        └── features/
            ├── dev/
            │   ├── editors/    # nvim, zed
            │   └── git/        # git, gh, lazygit
            └── shell/          # fish, starship, tmux, fzf, zoxide, cli
```

All `.nix` files under `modules/` are auto-imported via `import-tree`. Profiles (`vm`, `laptop`, `desktop`) are defined in `homes.nix` using den's `den.homes` option.

## Prerequisites

- [Nix](https://docs.determinate.systems/determinate-nix/) with flakes enabled

## Initial Setup (first time on a machine)

`home-manager` is not yet on `$PATH`, so bootstrap with:

```sh
nix run 'nixpkgs#home-manager' -- switch --flake .#<profile>
```

This installs Home Manager and applies the configuration. After this, use the installed CLI:

```sh
home-manager switch --flake .#<profile>
```

Available profiles: `vm`, `laptop`, `desktop`.
