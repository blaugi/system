{ config, pkgs, isHeadless, ... }:

{
  dconf.enable = !isHeadless;

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    
    # Stylix requires a wallpaper image to generate color palettes.
    # Even if you don't use it on a desktop environment, it's needed for the module to evaluate.
    # Because `base16Scheme` is explicitly set above, Stylix will NOT derive colors from this image—it will stay strictly Tokyo Night.
    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/NixOS/nixos-artwork/master/wallpapers/nix-wallpaper-dracula.png";
      sha256 = "sha256-SykeFJXCzkeaxw06np0QkJCK28e0k30PdY8ZDVcQnh4=";
    };

    fonts = {
      monospace = {
        name = "CommitMono Nerd Font";
        package = pkgs.nerd-fonts.commit-mono;
      };
      sizes.terminal = 12;
    };

    targets = {
      gtk.enable = !isHeadless;
      kde.enable = !isHeadless;
      gnome.enable = !isHeadless;
      neovim.enable = false; 
      fish.enable = !isHeadless;
    };
  };
}