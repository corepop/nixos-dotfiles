{ pkgs, ... }:

{
  # Add fish to the list of valid login shells
  environment.shells = with pkgs; [ fish ];

  # Set fish as the shell for your user
  users.users.sebastian.shell = pkgs.fish;

  # Optional: make sure fish is installed system-wide
  environment.systemPackages = with pkgs; [ fish ];
}
