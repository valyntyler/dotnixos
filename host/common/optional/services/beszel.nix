{config, ...}: let
  cfg = config.services.beszel;
  domain = "monitor.valyntyler.com";
in {
  services.beszel = {
    hub = {
      enable = true;
      host = "0.0.0.0";
      port = 8090;
    };
    agent = {
      enable = true;
      openFirewall = true;
      environment = {
        HUB_URL = "https://${domain}";
        KEY = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF6I225ECCC4OwUohti7s9A3mW0OoHorJ3o07TuwYpA1";
      };
      environmentFile = config.sops.secrets."beszel/token".path;
    };
  };
  services.nginx.virtualHosts."${domain}" = {
    forceSSL = true;
    enableACME = true;
    locations."/".proxyPass = "http://127.0.0.1:${toString cfg.hub.port}";
  };
  sops.secrets."beszel/token".owner = "beszel-agent";
}
