let
  host = "social.valyntyler.com";
  port = 8157;
in {
  services.gotosocial = {
    enable = true;
    openFirewall = true;
    setupPostgresqlDB = false;
    settings = {
      inherit host port;
      protocol = "https";
      bind-address = "127.0.0.1";
    };
  };
  services.nginx.virtualHosts."${host}" = {
    forceSSL = true;
    enableACME = true;
    locations."/".proxyPass = "http://127.0.0.1:${toString port}";
  };
}
