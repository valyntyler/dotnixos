{config, ...}: let
  cfg = config.services.vaultwarden;
  domain = "vault.valyntyler.com";
in {
  services.vaultwarden = {
    enable = true;
    # backupDir = "/var/local/vaultwarden/backup";
    environmentFile = config.sops.secrets."vaultwarden/env".path;
    config = {
      DOMAIN = "https://${domain}";
      SIGNUPS_ALLOWED = false;
      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8222;
      ROCKET_LOG = "critical";

      # # This example assumes a mailserver running on localhost,
      # # thus without transport encryption.
      # # If you use an external mail server, follow:
      # #   https://github.com/dani-garcia/vaultwarden/wiki/SMTP-configuration
      # SMTP_HOST = "127.0.0.1";
      # SMTP_PORT = 25;
      # SMTP_SECURITY = "off";
      #
      # SMTP_FROM = "admin@bitwarden.example.com";
      # SMTP_FROM_NAME = "example.com Bitwarden server";
    };
  };
  services.nginx.virtualHosts."${domain}" = {
    enableACME = true;
    forceSSL = true;
    locations."/" = {
      proxyPass = "http://127.0.0.1:${toString cfg.config.ROCKET_PORT}";
      proxyWebsockets = true;
    };
  };
  sops.secrets."vaultwarden/env".owner = "vaultwarden";
}
