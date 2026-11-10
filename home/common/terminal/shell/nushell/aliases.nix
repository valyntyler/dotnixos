{
  programs.nushell.shellAliases = {
    e = "nvim";
    l = "ls";
    o = "xdg-open .";
    cb = "fj -H codeberg.org";
    ex = "xdg-open";
    la = "ls -a";
    ll = "ls -l";
    za = "zellij attach -c";
    zj = "zellij";
    ze = "zoxide edit";
    nr = "nix run";
    hl = "hledger-ui";
    da = "direnv allow";
    dda = "direnv disallow";
    gpr = "git pull --rebase";
    sos = "ssh valyntyler.com; z os";
    rcon = "rcon-cli";
    tree = "eza --tree";
    lsusb = "cyme -l";
    license = "license-generator";
    speedtest = "speedtest-go";
  };
}
