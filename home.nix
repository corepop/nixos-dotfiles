{ config, pkgs, lib, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  # Auto-discover config directories — any directory under config/ gets
  # symlinked to ~/.config/<name>.  Just create a config/<name>/ dir and
  # you're done.  Uses builtins.path to stay evaluable in pure mode.
  configDirStore = builtins.path { path = ./config; name = "dotfile-configs"; };
  configDirs = lib.filterAttrs (name: type: type == "directory")
    (builtins.readDir configDirStore);
in

{
  xdg.configFile = builtins.listToAttrs (map (name: {
    inherit name;
    value = {
      source = create_symlink "${dotfiles}/${name}";
      recursive = true;
    };
  }) (builtins.attrNames configDirs));

  home.username = "sebastian";
  home.homeDirectory = "/home/sebastian";
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;

  imports = [
    ./modules/neovim.nix
    ./modules/opencode.nix
    ./modules/home
    ./modules/display/plasma/home.nix
    ./modules/gaming/steam.nix
  ];
}
