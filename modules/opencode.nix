{ config, pkgs, ... }:

let
  mcpConfig = {
    mcp = {
      nixos = {
        type = "local";
        command = [ "mcp-nixos" ];
        enabled = true;
      };
      nix-agent = {
        type = "local";
        command = [ "nix-agent" ];
        enabled = true;
      };
    };
  };
in

{
  xdg.configFile."opencode/opencode.json" = {
    text = builtins.toJSON mcpConfig;
  };
}
