{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # nice gtk4/libwaita apps
    alpaca
    ascii-draw
    bazaar
    calligraphy
    convey
    coulr
    crosspipe
    delfin
    dissent
    eartag
    flare-signal
    foliate
    fractal
    gamepad-mirror
    gelly
    nocturne
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
