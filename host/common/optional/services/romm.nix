let
  domain = "games.valyntyler.com";
  port = 7939;
in {
  services.romm = {
    inherit port;
    enable = true;
    nginx.enable = false;
  };
  services.nginx.virtualHosts.${domain} = {
    forceSSL = true;
    enableACME = true;
    locations."/".proxyPass = "http://127.0.0.1:" + toString port;
  };
}
