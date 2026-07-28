{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  # Standard .config/directory
  configs = {
    nvim = "nvim";
    qtile = "qtile";
    rofi = "rofi";
    foot = "foot";
    ghostty = "ghostty";

    picom = "picom";
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

  ];
  programs = {
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      osFlake = "/home/sebastian/nixos-dotfiles/";
    };
    bash = {
      enable = true;
      shellAliases = {
        rebuild = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixos-desktop";
        btw = "echo i use nixos, btw";
      };
    };
  };
  home.packages = with pkgs; [
    ghostty
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc
    nixd
    librewolf
    rofi
    foot
    zed-editor-fhs
    picom
    fish
    mcp-nixos
    (pkgs.writeShellApplication {
      name = "ns";
      runtimeInputs = with pkgs; [
        fzf
        nix-search-tv
      ];
      text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
    })
  ];

}
