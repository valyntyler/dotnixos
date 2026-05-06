{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    apostrophe
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
    resources
    share-preview
    switcheroo
    tangram
    textpieces
    video-trimmer
    warp
    webfont-bundler
    wike
    wordbook

    # these deserve to be a circle apps
    # bottles
    alpaca
    crosspipe
    exhibit
    foliate
    fractal
    gelly
    packet
    planify
    pods
    refine
    rnote
    varia
  ];
}
