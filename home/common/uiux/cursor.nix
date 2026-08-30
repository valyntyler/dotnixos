{
  config,
  pkgs,
  ...
}: let
  cfg = config.home;
in {
  home.pointerCursor = {
    enable = true;
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
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
