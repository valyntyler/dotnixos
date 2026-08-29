{
  config,
  lib,
  ...
}
: let
  inherit (builtins) mapAttrs match readDir readFile;
  inherit (lib) concatStringsSep filterAttrs mapAttrsToList mkMerge pipe;
  root = ./.;
  cfg = config.programs.nushell;
  files = pipe root [
    readDir
    (filterAttrs (_: type: type == "regular"))
    (filterAttrs (name: _: match ".*\\.nu" name != null))
  ];
in {
  home.file = pipe files [
    (mapAttrs (name: _: readFile (root + "/${name}")))
    (mapAttrs (_: text: {inherit text;}))
    (mapAttrsToList (name: value: {"${cfg.configDir}/scripts/${name}" = value;}))
    mkMerge
  ];
  programs.nushell.extraConfig = concatStringsSep "\n" [
    (pipe files [
      (mapAttrsToList (name: _: "source ${root}/${name}"))
      (concatStringsSep "\n")
    ])
  ];
}
