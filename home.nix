{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    nvim = "nvim";
    rofi = "rofi";
    foot = "foot";
    ghostty = "ghostty";
  };
in

{
  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;

  home.username = "sebastian";
  home.homeDirectory = "/home/sebastian";
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;

  imports = [
    ./modules/neovim.nix
    ./modules/opencode.nix
    ./modules/home/shell.nix
    ./modules/home/packages.nix
  ];
}
