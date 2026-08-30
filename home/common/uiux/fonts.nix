{pkgs, ...}: {
  home.packages = with pkgs; [
    ibm-plex
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];
}
