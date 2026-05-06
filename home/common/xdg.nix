{
  xdg = {
    enable = true;
    autostart.enable = true;
    desktopEntries = builtins.listToAttrs (map (name: {
        inherit name;
        value = {
          name = "";
          noDisplay = true;
        };
      }) [
        "aerc"
        "btop"
        "fish"
        "nvim"
        "yazi"
        "nvtop"
      ]);
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/json" = ["org.gnome.TextEditor.desktop"];
        "application/pdf" = ["org.gnome.Papers.desktop"];
        "application/zip" = ["org.gnome.FileRoller.desktop"];
        "image/jpeg" = ["org.gnome.Loupe.desktop"];
        "image/jpg" = ["org.gnome.Loupe.desktop"];
        "image/png" = ["org.gnome.Loupe.desktop"];
        "image/svg+xml" = ["org.inkscape.Inkscape.desktop"];
        "text/html" = ["firefox.desktop"];
        "text/markdown" = ["org.gnome.gitlab.somas.Apostrophe.desktop"];
        "text/plain" = ["org.gnome.TextEditor.desktop"];
        "video/webm" = ["org.gnome.Showtime.desktop"];
        "x-scheme-handler/about" = "firefox.desktop";
        "x-scheme-handler/http" = ["firefox.desktop"];
        "x-scheme-handler/https" = ["firefox.desktop"];
        "x-scheme-handler/unknown" = "firefox.desktop";
      };
    };
  };
}
