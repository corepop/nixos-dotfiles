{ config, pkgs, lib, inputs, ... }:

let
  kwin-better-blur = inputs.kwin-effects-better-blur-dx.packages.${pkgs.system}.default;
in

{
  # Install the compiled KWin C++ plugin system-wide
  environment.systemPackages = [ kwin-better-blur ];
}
