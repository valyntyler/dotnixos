{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.vintagestory-nix.nixosModules.default];
  services.vintagestory = {
    enable = true;
    package = pkgs.vintagestoryPackages.v1-21-0;
    openFirewall = true;
  };
}
