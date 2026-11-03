{
  config,
  pkgs,
  ...
}: let
  cfg = config.home;
  name = "Bibata-Modern-Classic";
  size = 24;
in {
  home.pointerCursor = {
    inherit name size;
    enable = true;
    package = pkgs.bibata-cursors;
    dotIcons.enable = true;
    gtk.enable = true;
    x11.enable = true;
  };
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      cursor-theme = cfg.pointerCursor.name;
      cursor-size = cfg.pointerCursor.size;
    };
  };
}
