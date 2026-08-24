let
  port = 8088;
  domain = "paste.valyntyler.com";
in {
  services.wastebin = {
    enable = true;
    settings = {
      WASTEBIN_ADDRESS_PORT = "0.0.0.0:${toString port}";
      WASTEBIN_BASE_URL = "https://${domain}";
      WASTEBIN_TITLE = "Pastebin";
    };
  };
  services.nginx.virtualHosts."${domain}" = {
    forceSSL = true;
    enableACME = true;
    locations."/".proxyPass = "http://127.0.0.1:${toString port}";
  };
}
