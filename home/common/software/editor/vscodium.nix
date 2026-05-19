{pkgs, ...}: {
  programs.vscodium = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        vscodevim.vim
        vue.volar
      ];
    };
  };
}
