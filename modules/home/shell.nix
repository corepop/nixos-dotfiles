{ ... }:

{
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
    fish = {
      enable = true;
    };
  };
}
