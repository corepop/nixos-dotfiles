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

    kineticwe = {
      url = "gitlab:theblackdon/kineticwe";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-rocksmith = {
      url = "github:re1n0/nixos-rocksmith";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @
    {
      nixpkgs,
      home-manager,
      nix-agent,
      plasma-manager,
      nix-cachyos-kernel,
      kineticwe,
      ...
    }:
    {
      nixosConfigurations.nixos-desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          kineticwe.nixosModules.default
          nix-agent.nixosModules.default
          home-manager.nixosModules.home-manager
          inputs.nixos-rocksmith.nixosModules.default
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
          {
            nixpkgs.overlays = [ nix-cachyos-kernel.overlays.pinned ];
          }
        ];
      };
    };
}
