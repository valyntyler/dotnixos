{pkgs, ...}: {
  environment.systemPackages = with pkgs.gnomeExtensions; [
    battery-health-charging
    bluetooth-battery-meter
    blur-my-shell
    burn-my-windows
    caffeine
    draw-on-gnome
    hide-top-bar
    just-perfection
  ];
}
