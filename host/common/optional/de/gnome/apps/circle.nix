{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # apostrophe
    authenticator
    binary
    blanket
    cartridges
    curtail
    diebahn
    drum-machine
    forge-sparks
    fragments
    fretboard
    gnome-decoder
    gradia
    impression
    keypunch
    lorem
    newsflash
    resources
    share-preview
    switcheroo
    tangram
    textpieces
    tuba
    video-trimmer
    warp
    webfont-bundler
    wike
    wordbook
  ];
}
