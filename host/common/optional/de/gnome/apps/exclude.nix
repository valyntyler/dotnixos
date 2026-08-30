{pkgs, ...}: {
  environment.gnome.excludePackages = with pkgs; [
    yelp
    gnome-tour
    simple-scan
  ];
}
