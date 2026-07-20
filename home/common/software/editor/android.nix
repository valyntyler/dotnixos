{
  pkgs,
  inputs,
  ...
}: let
  pkgsStale = import inputs.nixpkgs-stable {
    inherit (pkgs.stdenv.hostPlatform) system;
    config.allowUnfree = true;
  };
in {
  # home.packages = with pkgsStale; [android-studio];
}
