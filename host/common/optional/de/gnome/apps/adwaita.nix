{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # nice gtk4/libwaita apps
    alpaca
    ascii-draw
    calligraphy
    coulr
    crosspipe
    dissent
    eartag
    flare-signal
    foliate
    fractal
    gamepad-mirror
    gelly
    packet
    planify
    pods
    poliedros
    refine
    rnote
    varia

    # bottles
    # exhibit
    # pdfarranger
    # libellus
    # words
    # pulp
  ];
}
