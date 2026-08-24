let
  flake = /home/valyn/.nixos;
in {
  programs.nh = {
    inherit flake;
    enable = true;
    clean.enable = true;
  };

  # zellij integration
  programs.nushell.environmentVariables.NH_FLAKE = "/home/valyn/.nixos";
}
