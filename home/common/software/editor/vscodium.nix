{pkgs, ...}: {
  programs.vscodium = {
    enable = false;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      vscodevim.vim
      vue.volar
      yzhang.markdown-all-in-one
    ];
  };
}
