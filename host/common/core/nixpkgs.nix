{inputs, ...}: {
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    inputs.nix-minecraft.overlay
    inputs.vintagestory-nix.overlays.default
  ];
}
