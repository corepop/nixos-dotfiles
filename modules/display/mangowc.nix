{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mangowc
    xdg-desktop-portal-wlr
    swaybg
    waybar
    wl-clip-persist
    cliphist
    wl-clipboard
    wlsunset
    swaynotificationcenter
    pamixer
    sway-audio-idle-inhibit
    swayidle
    brightnessctl
    swayosd
    wlr-randr
    grim
    slurp
    satty
    swaylock-effects
    wlogout
    sox
  ];
}
