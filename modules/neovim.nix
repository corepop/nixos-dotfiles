{ config, pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    sideloadInitLua = true;
    withNodeJs = true;
    extraPackages = with pkgs; [
      # Telescope
      ripgrep

      # Language Servers
      nil
      nixpkgs-fmt
      lua-language-server
      typescript-language-server
      vscode-css-languageserver
      intelephense

      # lazy.nvim plugin builds
      nodejs
      gcc
      tree-sitter
    ];
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
