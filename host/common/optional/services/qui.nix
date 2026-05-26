{config, ...}: let
  cfg = config.services.qui;
  sopsPath = "qui/session";
in {
  services.qui = {
    enable = true;
    openFirewall = true;
    secretFile = config.sops.secrets."${sopsPath}".path;
  };
  services.nginx.virtualHosts."qui.valyntyler.com" = {
    forceSSL = true;
    enableACME = true;
    locations."/".proxyPass = "http://127.0.0.1:${builtins.toString cfg.settings.port}";
  };
  sops.secrets."${sopsPath}".owner = cfg.user;
}
