{ pkgs, ... }:

{
  # Enable fish as the system shell (configures PATH generation, etc.)
  programs.fish.enable = true;

  # Add fish to valid login shells
  environment.shells = with pkgs; [ fish ];

  users.users."sebastian" = {
    isNormalUser = true;
    description = "sebastian";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "rtkit"
    ];
    shell = pkgs.fish;
  };

  services.printing.enable = true;
}
