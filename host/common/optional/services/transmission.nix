{
  config,
  pkgs,
  user,
  ...
}: let
  cfg = config.services.transmission;
in {
  services.transmission = {
    inherit user;
    # FIX: config and incomplete dir creation
    # FIX: home directory variable source
    home = "/home/${user}";
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
    };
    credentialsFile = config.sops.secrets."transmission/json".path;
  };
  services.nginx.virtualHosts."transmission.valyntyler.com" = {
    forceSSL = true;
    enableACME = true;
    locations."/".proxyPass = "http://127.0.0.1:${builtins.toString cfg.settings.rpc-port}";
  };
  sops.secrets."transmission/json" = {
    owner = user;
    restartUnits = ["transmission.service"];
  };
}
