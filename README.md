# Home Manager Flake Setup

Simple system config using [Nix Flakes](https://nixos.wiki/wiki/Flakes), [flake-parts](https://flake.parts/), and [Home Manager](https://nix-community.github.io/home-manager/), organized using the [dendritic pattern](https://github.com/mightyiam/dendritic).

## Usage

### 1. Prerequisites

- [Nix](https://docs.determinate.systems/determinate-nix/) installed natively.
- Flakes must be enabled in your setup.

### 2. File Structure

```
.
├── flake.nix                              # Entry point: flake-parts + import-tree ./modules
├── flake copy.nix                         # Backup of the old, pre-dendritic flake (not evaluated)
└── modules/                                # Every .nix file here is auto-imported (vic/import-tree)
    ├── options.nix                         # Declares the `flake.modules.<class>.<aspect>` option
    └── home-manager/
        ├── shell-fish.nix                  # flake.modules.homeManager.shell-fish
        ├── tools-cli.nix                   # flake.modules.homeManager.tools-cli
        ├── tools-git.nix                   # flake.modules.homeManager.tools-git
        ├── theme.nix                       # flake.modules.homeManager.theme (Stylix)
        ├── editors-zed.nix                 # flake.modules.homeManager.editors-zed
        ├── base.nix                        # flake.modules.homeManager.base (aggregates the above)
        └── configurations.nix              # Builds flake.homeConfigurations.{headless,desktop}
```

Each file under `modules/` is itself a flake-parts module. Instead of hand-written
`imports` lists, every "aspect" (fish shell, CLI tools, git tooling, theming, editor
config, ...) registers itself under `flake.modules.homeManager.<name>`. `base.nix`
pulls the named aspects back together via `config.flake.modules.homeManager.*`, and
`configurations.nix` feeds the assembled `base` module into
`home-manager.lib.homeManagerConfiguration` to produce the `headless` and `desktop`
profiles. See `modules/options.nix` for the option declaration that makes this
merging safe.

### 3. Applying the Configuration

<<<<<<< HEAD
For the initial installation:

```sh
nix run home-manager/master -- switch --flake .#headless 
=======
Deploy the Home Manager profile defined by the flake (e.g. `desktop`):

```sh
nix run home-manager/master -- switch --flake .#headless
# or
nix run home-manager/master -- switch --flake .#desktop
>>>>>>> 73f0a73 (sync progress)
```

Once Home Manager is installed, you can simply use:

```sh
home-manager switch --flake .#<profile>
```

Replace `<profile>` with either `headless` or `desktop` depending on your needs.

---
