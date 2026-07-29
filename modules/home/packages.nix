{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ghostty
    librewolf
    rofi
    foot
    zed-editor-fhs
    fish
    dgop
    faugus-launcher
  ];
}
