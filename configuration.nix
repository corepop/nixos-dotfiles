{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ./modules/system/boot.nix
    ./modules/system/locale.nix
    ./modules/system/networking.nix
    ./modules/system/audio.nix
    ./modules/system/users.nix
    ./modules/system/packages.nix
    ./modules/system/fonts.nix
    ./modules/system/nix.nix

    ./modules/display/plasma/system.nix
  ];

  system.stateVersion = "26.05";
}
