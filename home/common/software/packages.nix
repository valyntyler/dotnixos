{pkgs, ...}: {
  home.packages = with pkgs; [
    bitwarden-desktop
    eden
    galaxy-buds-client
    heroic
    iaito
    jellyfin-desktop
    karere
    libreoffice-fresh
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
