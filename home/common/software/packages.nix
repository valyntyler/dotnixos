{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # bitwarden-desktop
    galaxy-buds-client
    iaito
    karere
    libreoffice-fresh
    pwvucontrol
    qwertone
    signal-desktop
    telegram-desktop
    tigervnc
    vmpk
    wl-clipboard
    # inputs.nix-software-center.packages.${system}.nix-software-center
  ];
}
