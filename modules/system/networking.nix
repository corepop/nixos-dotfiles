{ ... }:

{
  networking.hostName = "nixos-desktop";
  networking.networkmanager.enable = true;
  networking.wireless.enable = true;

  services.openssh.enable = true;

  networking.firewall.enable = true;
}
