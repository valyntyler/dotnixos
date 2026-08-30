{pkgs, ...}: {
  home.packages = with pkgs; [
    # bitwarden-desktop
    galaxy-buds-client
    iaito
    karere
    libreoffice-fresh
    pwvucontrol
    qwertone
    signal-desktop
    tigervnc
    vmpk
    wl-clipboard
  ];
}
