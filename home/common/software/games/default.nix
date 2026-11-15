{pkgs, ...}: {
  home.packages = with pkgs; [
    eden
    heroic
    openra
    pandora-launcher
    prismlauncher
    ryubing
    vintagestory
  ];
}
