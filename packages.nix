{ pkgs ? import <nixpkgs> {} }:

{
  myPackages = [
    pkgs.ripgrep
    pkgs.neovim
    pkgs.fzf
  ];
}
