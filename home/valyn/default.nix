{inputs, ...}: {
  imports = [
    ../common/software/services/walker.nix
    ../common/software/browser
    ../common/software/editor
    ../common/software/email
    ../common/software/games
    ../common/software/launcher
    ../common/software/creation.nix
    ../common/software/packages.nix
    ../common/terminal/emulator
    ../common/terminal/programs
    ../common/terminal/prompt
    ../common/terminal/shell
    ../common/terminal/packages.nix
    ../common/uiux/cursor.nix
    ../common/uiux/dconf.nix
    ../common/uiux/fonts.nix
    ../common/uiux/gtk.nix
    ../common/uiux/xdg.nix
  ];

  home = {
    username = "valyn";
    homeDirectory = "/home/valyn";
    stateVersion = "24.05";
  };

  targets.genericLinux.enable = true;
  programs.home-manager.enable = true;
}
