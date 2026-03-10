{ pkgs, ... }:

{
  home.packages = with pkgs; [
    uv
    go
    rustup
  ];
}