{pkgs, ...}: {
  services.vintagestory = {
    enable = true;
    package = pkgs.vintagestoryPackages.v1-21-0;
    openFirewall = true;
  };
}
