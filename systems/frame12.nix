{inputs, ...}: {
  flake = let
    system = "x86_64-linux";
    host = "frame12";
    user = "valyn";
    specialArgs = {inherit inputs host user;};
  in {
    nixosConfigurations.frame12 = inputs.nixpkgs.lib.nixosSystem {
      inherit system specialArgs;
      modules = [
        ../host/frame12
        ../modules/nixos
        inputs.sops-nix.nixosModules.sops
        inputs.musnix.nixosModules.musnix
        inputs.home-manager.nixosModules.home-manager
        inputs.nixos-hardware.nixosModules.framework-12-13th-gen-intel
      ];
    };
  };
}
