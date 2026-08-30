{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gnome-boxes
    gnome-sound-recorder
    gnome-usage
    gnome-tecla
  ];
}
