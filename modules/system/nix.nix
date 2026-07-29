{ ... }:

{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    # Binary cache for CachyOS kernel — avoids compiling the kernel from source
    extra-substituters = [ "https://attic.xuyh0120.win/lantian" ];
    extra-trusted-public-keys = [ "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" ];
    trusted-users = [
      "root"
      "sebastian"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  programs.nix-agent.enable = true;
}
