{
  description = "Flake for NixOS on desktop";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-agent = {
      url = "github:JEFF7712/nix-agent";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    # Do not override its nixpkgs input, otherwise there can be mismatch between patches and kernel version
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nix-agent,
      plasma-manager,
      nix-cachyos-kernel,
      ...
    }:
    {
      nixosConfigurations.nixos-desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          (
            { pkgs, ... }:
            {
              nixpkgs.overlays = [ nix-cachyos-kernel.overlays.pinned ];
              boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;

              # Binary cache is auto-configured via nixConfig in flake.nix,
              # no additional binary cache config is needed.

              # ... your other configs
            }
          )
          ./configuration.nix
          nix-agent.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              users.sebastian = { ... }: {
                imports = [
                  ./home.nix
                  plasma-manager.homeModules.plasma-manager
                ];
              };
            };
          }
        ];
      };
    };
}
