{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs;
    [
      blender
      # freecad
      gimp3
      inkscape
      krita
      lmms
      material-maker
      obs-studio

      audacity
      musescore

      # davinci-resolve

      vital
    ]
    ++ (let
      pkgs-stable = import inputs.nixpkgs-stable {
        inherit (pkgs.stdenv.hostPlatform) system;
        config.allowUnfree = true;
      };
    in
      with pkgs-stable; [
        aseprite
        guitarix
        reaper
      ]);
}
