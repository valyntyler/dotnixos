{pkgs, ...}: {
  home.packages = with pkgs; [
    # bitwarden-desktop
    eden
    galaxy-buds-client
    grandorgue
    heroic
    iaito
    jellyfin-desktop
    karere
    libreoffice-fresh
    nicotine-plus
    openra
    prismlauncher
    pwvucontrol
    qwertone
    ryubing
    signal-desktop
    tigervnc
    vmpk
    wl-clipboard
  ];
}
