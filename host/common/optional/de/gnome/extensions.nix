{pkgs, ...}: {
  environment.systemPackages = with pkgs.gnomeExtensions; [
    appindicator
    arc-menu
    blur-my-shell
    burn-my-windows
    hide-top-bar
    just-perfection
    paperwm
    search-light
    totp
    void

    battery-health-charging
    bluetooth-battery-meter

    copyous
    draw-on-gnome
  ];
}
