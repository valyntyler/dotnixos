{pkgs, ...}: {
  home.packages = with pkgs; [
    superfile
    circumflex
    # https://github.com/emprcl/signls
    # https://github.com/Broderick-Westrope/tetrigo

    # utils
    alda
    cf-tool
    cyme
    dig
    duf
    forgejo-cli
    gfold
    glow
    gnumake
    hledger
    hledger-ui
    imagemagick
    lsof
    ouch
    pass
    radare2
    rcon-cli
    sbctl
    scli
    sops
    stow
    tlock

    # repo
    gen-license
    license-generator

    # screensavers
    cbonsai
    cmatrix
    sl

    # speedtest
    speedtest-go

    # typing test
    toipe
    ttyper
    typer
    typtea

    # games
    cl-wordle
  ];
}
