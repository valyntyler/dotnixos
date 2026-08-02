{pkgs, ...}: {
  home.packages = with pkgs; [
    # styling
    nwg-look

    # icons
    morewaita-icon-theme

    # cursors
    bibata-cursors
    capitaine-cursors-themed
  ];
}
