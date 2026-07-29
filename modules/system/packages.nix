{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    git
    bat
    tree
    tldr
    ripgrep
    nil
    nixd
    nixpkgs-fmt
    nodejs
    gcc
    mcp-nixos
    fzf
    nix-search-tv
    rtaudio
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
