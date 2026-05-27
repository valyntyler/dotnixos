{pkgs, ...}: {
  home.packages = with pkgs; [
    bitwarden-desktop
    eden
    galaxy-buds-client
    iaito
    jellyfin-desktop
    karere
    libreoffice-fresh
    obsidian
    openra
    prismlauncher
    pwvucontrol
    ryubing
    signal-desktop
    tigervnc
    vmpk
    wl-clipboard
  ];
}
