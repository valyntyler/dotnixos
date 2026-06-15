{
  config,
  pkgs,
  ...
}: let
  cfg = config.services.transmission;
  # sopsPath = "qui/session";
in {
  services.transmission = {
    enable = true;
    package = pkgs.transmission_4;
    openRPCPort = true;
    openPeerPorts = true;
    settings = {
      rpc-bind-address = "0.0.0.0";
      rpc-whitelist = "127.0.0.1";
      rpc-whitelist-enabled = false;
      rpc-host-whitelist-enabled = false;
    };
    # secretFile = config.sops.secrets."${sopsPath}".path;
  };
  services.nginx.virtualHosts."transmission.valyntyler.com" = {
    forceSSL = true;
    enableACME = true;
    locations."/".proxyPass = "http://127.0.0.1:${builtins.toString cfg.settings.rpc-port}";
  };
  # sops.secrets."${sopsPath}".owner = cfg.user;
}
