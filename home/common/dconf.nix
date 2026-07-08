{lib, ...}: {
  # TODO: builtins.readfile function for .desktop files
  dconf.settings = with lib.hm.gvariant; {
    "org/gnome/desktop/interface" = {
      # dark mode
      color-scheme = "prefer-dark";

      # configure clock
      clock-show-seconds = false;
      clock-show-weekday = false;
    };

    # fix timezone
    "org/gnome/system/location".enabled = true;
    "org/gnome/desktop/datetime".automatic-timezone = true;

    # fix touchpad
    "org/gnome/desktop/peripherals/touchpad" = {
      disable-while-typing = false;
    };

    # fix screen auto-rotate
    "org/gnome/settings-daemon/peripherals/touchscreen" = {
      orientation-lock = false;
    };

    "org/gnome/desktop/wm/preferences" = {
      # top-bar buttons
      button-layout = ":maximize,minimize,close";
    };

    "org/gnome/gnome-session" = {
      # disable shutdown warning
      # logout-prompt = false;
    };

    "org/gnome/desktop/input-sources" = {
      # set keyboard language
      sources = [(mkTuple ["xkb" "ro"])];
    };

    "org/gnome/settings-daemon/plugins/power" = {
      # disable auto suspend
      # sleep-inactive-ac-type = "nothing";

      # power button shutdown
      # power-button-action = "interactive";
    };

    "org/gnome/desktop/session" = {
      # disable screen blank
      # idle-delay = mkUint32 0;
    };

    "org/gnome/desktop/wm/keybindings" = {
      # switch workspaces
      switch-to-workspace-1 = ["<Super>1"];
      switch-to-workspace-2 = ["<Super>2"];
      switch-to-workspace-3 = ["<Super>3"];
      switch-to-workspace-4 = ["<Super>4"];
      switch-to-workspace-5 = ["<Super>5"];
      switch-to-workspace-6 = ["<Super>6"];
      switch-to-workspace-7 = ["<Super>7"];
      switch-to-workspace-8 = ["<Super>8"];
      switch-to-workspace-9 = ["<Super>9"];
      switch-to-workspace-10 = ["<Super>0"];

      # move active program to specified workspace
      move-to-workspace-1 = ["<Shift><Super>1"];
      move-to-workspace-2 = ["<Shift><Super>2"];
      move-to-workspace-3 = ["<Shift><Super>3"];
      move-to-workspace-4 = ["<Shift><Super>4"];
      move-to-workspace-5 = ["<Shift><Super>5"];
      move-to-workspace-6 = ["<Shift><Super>6"];
      move-to-workspace-7 = ["<Shift><Super>7"];
      move-to-workspace-8 = ["<Shift><Super>8"];
      move-to-workspace-9 = ["<Shift><Super>9"];
      move-to-workspace-10 = ["<Shift><Super>0"];

      # enter fullscreen
      toggle-fullscreen = ["<Super>f"];

      # show desktop
      show-desktop = ["<Super>d"];

      # switch between all windows
      switch-windows = ["<Alt>Tab"];
      switch-windows-backward = ["<Shift><Alt>Tab"];

      # disable default behaviour
      switch-applications = [];
      switch-applications-backward = [];

      # disable Mod+Space
      switch-input-source = [];
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      # faster scrolling in neovim
      delay = mkUint32 300;
      repeat-interval = mkUint32 15;
    };

    "org/gnome/shell/keybindings" = {
      # unbind launch shortcuts
      switch-to-application-1 = [];
      switch-to-application-2 = [];
      switch-to-application-3 = [];
      switch-to-application-4 = [];
      switch-to-application-5 = [];
      switch-to-application-6 = [];
      switch-to-application-7 = [];
      switch-to-application-8 = [];
      switch-to-application-9 = [];
      switch-to-application-10 = [];

      # unbind Super+M for custom binds
      toggle-message-tray = ["<Super>V"];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      # open home folder in nautilus
      home = ["<Super>E"];

      # specify custom binds
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/"
      ];
    };

    # launch terminal
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>Return";
      command = "ghostty";
      name = "terminal";
    };

    # open browser
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Super>W";
      command = "wofizilla firefox";
      name = "browser";
    };

    # open email client
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      binding = "<Super>M";
      command = "wofizilla thunderbird";
      name = "email client";
    };

    # open launcher
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      binding = "<Super>Space";
      command = "sherlock";
      name = "launcher";
    };

    # open launcher
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4" = {
      binding = "<Ctrl><Shift>Escape";
      command = "resources";
      name = "task manager";
    };

    # set wallpaper image
    "org/gnome/desktop/background" = let
      imagePath = ../../assets/szczeliniec-wielki.jpg;
    in {
      picture-uri = "file://" + toString imagePath;
      picture-uri-dark = "file://" + toString imagePath;
    };

    # specify app folders
    "org/gnome/desktop/app-folders" = {
      folder-children = ["Utilities" "Circle" "Programming" "Creation" "Office" "Sound & Video" "Games" "Settings"];
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      name = "Utilities";
      categories = ["X-GNOME-Utilities"];
      apps = [
        "nm-connection-editor.desktop"
        "org.freedesktop.GnomeAbrt.desktop"
        "org.gnome.Boxes.desktop"
        "org.gnome.Calculator.desktop"
        "org.gnome.Characters.desktop"
        "org.gnome.Connections.desktop"
        "org.gnome.Console.desktop"
        "org.gnome.DejaDup.desktop"
        "org.gnome.DiskUtility.desktop"
        "org.gnome.Evince.desktop"
        "org.gnome.FileRoller.desktop"
        "org.gnome.Papers.desktop"
        "org.gnome.SystemMonitor.desktop"
        "org.gnome.TextEditor.desktop"
        "org.gnome.Usage.desktop"
        "org.gnome.baobab.desktop"
        "org.gnome.font-viewer.desktop"
        "org.gnome.seahorse.Application.desktop"
        "org.gnome.tweaks.desktop"
        "org.gnome.Logs.desktop"
      ];
    };

    "org/gnome/desktop/app-folders/folders/Circle" = {
      name = "Circle";
      apps = [
        "com.jeffser.Alpaca.desktop"
        "org.gnome.gitlab.somas.Apostrophe.desktop"
        "com.belmoussaoui.Authenticator.desktop"
        "io.github.fizzyizzy05.binary.desktop"
        "com.rafaelmardojai.Blanket.desktop"
        "com.usebottles.bottles.desktop"
        "page.kramo.Cartridges.desktop"
        "com.github.huluti.Coulr.desktop"
        "io.gitlab.adhami3310.Converter.desktop"
        "com.github.huluti.Curtail.desktop"
        "io.github.dp0sk.Crosspipe.desktop"
        "com.belmoussaoui.Decoder.desktop"
        "de.schmidhuberj.DieBahn.desktop"
        "so.libdb.dissent.desktop"
        "io.github.revisto.drum-machine.desktop"
        "app.drey.EarTag.desktop"
        "io.github.nokse22.Exhibit.desktop"
        "de.schmidhuberj.Flare.desktop"
        "com.github.johnfactotum.Foliate.desktop"
        "com.mardojai.ForgeSparks.desktop"
        "org.gnome.Fractal.desktop"
        "de.haeckerfelix.Fragments.desktop"
        "dev.bragefuglseth.Fretboard.desktop"
        "page.codeberg.vendillah.GamepadMirror.desktop"
        "io.m51.Gelly.desktop"
        "be.alexandervanhee.gradia.desktop"
        "io.gitlab.adhami3310.Impression.desktop"
        "dev.bragefuglseth.Keypunch.Devel.desktop"
        "io.github.mrvladus.List.desktop"
        "org.gnome.design.Lorem.desktop"
        "io.github.nozwock.Packet.desktop"
        "io.github.alainm23.planify.desktop"
        "com.github.marhkb.Pods.desktop"
        "page.tesk.Refine.desktop"
        "net.nokyan.Resources.desktop"
        "com.github.flxzt.rnote.desktop"
        "com.rafaelmardojai.SharePreview.desktop"
        "re.sonny.Tangram.desktop"
        "io.gitlab.liferooter.TextPieces.desktop"
        "io.github.giantpinkrobots.varia.desktop"
        "org.gnome.gitlab.YaLTeR.VideoTrimmer.desktop"
        "app.drey.Warp.desktop"
        "com.rafaelmardojai.WebfontKitGenerator.desktop"
        "com.github.hugolabe.Wike.desktop"
        "dev.mufeed.Wordbook.desktop"
      ];
    };

    "org/gnome/desktop/app-folders/folders/Programming" = {
      name = "Programming";
      apps = [
        "android-studio.desktop"
        "arduino-ide.desktop"
        "code.desktop"
        "codium.desktop"
        "org.godotengine.Godot4.6.desktop"
        "neovide.desktop"
        "openscad.desktop"
        "unityhub.desktop"
        "io.github.RodZill4.Material-Maker.desktop"
        "codeblocks.desktop"
        "idea-community.desktop"
        "idea-oss.desktop"
        "idea.desktop"
        "rider.desktop"
        "ghidra.desktop"
        "org.radare.iaito.desktop"
        "org.wireshark.Wireshark.desktop"
      ];
    };

    "org/gnome/desktop/app-folders/folders/Creation" = {
      name = "Creation";
      apps = [
        "aseprite.desktop"
        "blender.desktop"
        "gimp.desktop"
        "org.freecad.FreeCAD.desktop"
        "org.inkscape.Inkscape.desktop"
        "org.kde.krita.desktop"
        "com.obsproject.Studio.desktop"
      ];
    };

    "org/gnome/desktop/app-folders/folders/Sound & Video" = {
      name = "Sound & Video";
      apps = [
        "ardour8.desktop"
        "audacity.desktop"
        "cockos-reaper.desktop"
        "davinci-resolve.desktop"
        "guitarix.desktop"
        "org.musescore.MuseScore.desktop"
        "org.rncbc.qjackctl.desktop"
        "org.zrythm.Zrythm.desktop"
        "net.sourceforge.VMPK.desktop"
        "lmms.desktop"
        "vital.desktop"
      ];
    };

    "org/gnome/desktop/app-folders/folders/Office" = {
      name = "Office";
      apps = [
        "startcenter.desktop"
        "writer.desktop"
        "impress.desktop"
        "calc.desktop"
        "base.desktop"
        "math.desktop"
        "draw.desktop"
      ];
    };

    "org/gnome/desktop/app-folders/folders/Games" = {
      name = "Games";
      categories = ["Game"];
      apps = ["xmcl.desktop"];
      excluded-apps = [
        "com.usebottles.bottles.desktop"
        "page.kramo.Cartridges.desktop"
        "protonup-qt.desktop"
        "steam.desktop"
      ];
    };

    "org/gnome/desktop/app-folders/folders/Settings" = {
      name = "Settings";
      apps = [
        "GalaxyBudsClient.desktop"
        "OpenRGB.desktop"
        "com.saivert.pwvucontrol.desktop"
        "nvidia-settings.desktop"
        "org.raspberrypi.rpi-imager.desktop"
        "LocalSend.desktop"
        "protonup-qt.desktop"
        "virt-manager.desktop"
        "virtualbox.desktop"
        "vncviewer.desktop"
      ];
    };

    "org/gnome/shell" = {
      # enabled-extensions = ["blur-my-shell@aunetx"];
      favorite-apps = [];
      app-picker-layout = map (lib.imap0 (position: (name: (mkDictionaryEntry [name (mkVariant [(mkDictionaryEntry ["position" (mkVariant position)])])])))) [
        [
          # row 1
          "nixos-manual.desktop"
          "org.gnome.Nautilus.desktop"
          "org.gnome.Epiphany.desktop"
          "org.gnome.Calendar.desktop"
          "org.gnome.Contacts.desktop"
          "org.gnome.clocks.desktop"
          "org.gnome.Weather.desktop"
          "org.gnome.Maps.desktop"
          # row 2
          "org.gnome.Snapshot.desktop"
          "org.gnome.SoundRecorder.desktop"
          "org.gnome.Loupe.desktop"
          "org.gnome.Showtime.desktop"
          "org.gnome.Decibels.desktop"
          "org.gnome.Music.desktop"
          "org.gnome.Extensions.desktop"
          "org.gnome.Settings.desktop"
          # row 3
          "Utilities"
          "Circle"
        ]
        [
          # row 1
          "Alacritty.desktop"
          "com.mitchellh.ghostty.desktop"
          "zen-beta.desktop"
          "firefox.desktop"
          "thunderbird.desktop"
          "discord.desktop"
          "signal.desktop"
          "io.github.tobagin.karere.desktop"
          # row 2
          "spotify.desktop"
          "steam.desktop"
          "Programming"
          "Office"
          "Creation"
          "Sound & Video"
          "Games"
          "Settings"
          # row 3
          "syncthing-ui.desktop"
          "org.jellyfin.JellyfinDesktop.desktop"
        ]
      ];
    };

    # transparency and blur
    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      brightness = 0.59999999999999998;
      override-background-dynamically = true;
      pipeline = "pipeline_default";
      sigma = 30;
    };

    "org/gnome/shell/extensions/blur-my-shell/applications" = {
      blur = true;
      dynamic-opacity = false;
      whitelist = [
        "GalaxyBudsClient"
        "better_control.py"
        "com.mitchellh.ghostty"
        "com.rafaelmardojai.Blanket"
        "de.haeckerfelix.Fragments"
        "dev.bragefuglseth.Fretboard"
        "io.gitlab.adhami3310.Impression"
        "org.gnome.Calculator"
        "org.gnome.Characters"
        "org.gnome.Contacts"
        "org.gnome.Extensions"
        "org.gnome.FileRoller"
        "org.gnome.Nautilus"
        "org.gnome.Settings"
        "org.gnome.Shell.Extensions"
        "org.gnome.SystemMonitor"
        "org.gnome.TextEditor"
        "org.gnome.Weather"
        "org.gnome.baobab"
        "org.gnome.clocks"
        "org.gnome.gitlab.somas.Apostrophe"
        "page.kramo.Cartridges"
        "io.github.fizzyizzy05.binary"
        "org.gnome.Calendar"
        "org.gnome.Decibels"
        "org.gnome.SoundRecorder"
        "org.gnome.Music"
        "org.gnome.Papers"
        "com.saivert.pwvucontrol"
        "com.belmoussaoui.Authenticator"
        "com.mardojai.ForgeSparks"
        "com.github.huluti.Curtail"
        "dev.bragefuglseth.Keypunch.Devel"
        "io.github.nozwock.Packet"
        "VSCodium"
        "net.nokyan.Resources"
        "org.gnome.Fractal"
        "io.github.alainm23.planify"
        "de.schmidhuberj.Flare"
        "io.m51.Gelly"
      ];
    };
  };
}
