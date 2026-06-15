{
  config,
  pkgs,
  user,
  ...
}: let
  cfg = config.services.transmission;
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
      rpc-authentication-required = true;
      rpc-username = "admin";
      rpc-password = "{da51cc9753f84bfd0b978a34a810d2c0fb725ef63ckwCq6W";
      # set appropriate permissions
      download-dir = "/home/${user}/Downloads";
    };
  };
  services.nginx.virtualHosts."transmission.valyntyler.com" = {
    forceSSL = true;
    enableACME = true;
    locations."/".proxyPass = "http://127.0.0.1:${builtins.toString cfg.settings.rpc-port}";
  };
}
