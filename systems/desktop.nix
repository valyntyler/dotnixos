{inputs, ...}: {
  flake = let
    system = "x86_64-linux";
    host = "desktop";
    user = "valyn";
    specialArgs = {inherit inputs host user;};
  in {
    nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
      inherit system specialArgs;
      modules = [
        ../host/desktop
        ../modules/nixos
        inputs.sops-nix.nixosModules.sops
        inputs.home-manager.nixosModules.home-manager
        inputs.nix-minecraft.nixosModules.minecraft-servers
      ];
    };
  };
}
