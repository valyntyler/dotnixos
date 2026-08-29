{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./scripts
    ./aliases.nix
    ./settings.nix
  ];
  programs.nushell = let
    banner = lib.getExe pkgs.nitch;
  in {
    enable = true;
    plugins = with pkgs.nushellPlugins; [formats];
    extraConfig = banner;
    environmentVariables.PAGER = pkgs.bat;
  };
}
