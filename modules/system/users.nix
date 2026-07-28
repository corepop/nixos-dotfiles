{ ... }:

{
  users.users."sebastian" = {
    isNormalUser = true;
    description = "sebastian";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  services.printing.enable = true;
}
