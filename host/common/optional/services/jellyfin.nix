{
  inputs,
  pkgs,
  user,
  ...
}: let
  pkgs-stable = import inputs.nixpkgs-stable {
    inherit (pkgs.stdenv.hostPlatform) system;
    config.allowUnfree = true;
  };
  domain = "media.valyntyler.com";
  port = 8096;
in {
  services.jellyfin = {
    inherit user;
    package = pkgs-stable.jellyfin;
    enable = true;
    openFirewall = true;
  };
  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];
  services.nginx.virtualHosts."${domain}" = {
    forceSSL = true;
    enableACME = true;
    locations."/".proxyPass = "http://127.0.0.1:${toString port}";
  };
}
