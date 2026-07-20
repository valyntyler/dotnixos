{
  inputs,
  pkgs,
  ...
}: let
  pkgs-stable = import inputs.nixpkgs-stable {
    inherit (pkgs.stdenv.hostPlatform) system;
    config.allowUnfree = true;
  };
in {
  home.packages = with pkgs-stable; [
    # jetbrains.idea
    # jetbrains.rider
  ];
}
