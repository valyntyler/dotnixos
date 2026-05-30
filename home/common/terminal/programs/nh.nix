{inputs, ...}: let
  flake = /home/valyn/.nixos;
in {
  programs.nh = {
    inherit flake;
    enable = true;
    package = inputs.nh.packages."x86_64-linux".default;
    clean.enable = true;
  };

  # zellij integration
  programs.nushell.environmentVariables.NH_FLAKE = "/home/valyn/.nixos";
}
