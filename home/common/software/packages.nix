{pkgs, ...}: {
  home.packages = with pkgs; [
    # bitwarden-desktop
    eden
    galaxy-buds-client
    heroic
    iaito
    karere
    libreoffice-fresh
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
