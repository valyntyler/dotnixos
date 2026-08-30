{pkgs, ...}: {
  home.packages = with pkgs; [
    eden
    heroic
    openra
    prismlauncher
    ryubing
    vintagestory
  ];
}
