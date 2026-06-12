{inputs, ...}: {
  flake = let
    system = "x86_64-linux";
    host = "ideapad";
    user = "valyn";
    specialArgs = {inherit inputs host user;};
  in {
    nixosConfigurations.ideapad = inputs.nixpkgs.lib.nixosSystem {
      inherit system specialArgs;
      modules = [
        ../host/ideapad
        ../modules/nixos
        inputs.sops-nix.nixosModules.sops
        inputs.lanzaboote.nixosModules.lanzaboote
        inputs.home-manager.nixosModules.home-manager
        inputs.nixos-hardware-ideapad.nixosModules.lenovo-ideapad-15ihu6
      ];
    };
  };
}
