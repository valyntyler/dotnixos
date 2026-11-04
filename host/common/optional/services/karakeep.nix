let
  domain = "saved.valyntyler.com";
  port = 4247;
in {
  services.karakeep = {
    enable = true;
    extraEnvironment = {
      PORT = toString port;
      DISABLE_SIGNUPS = "true";
      DISABLE_NEW_RELEASE_CHECK = "true";
    };
  };
  services.nginx.virtualHosts."${domain}" = {
    forceSSL = true;
    enableACME = true;
    locations."/".proxyPass = "http://127.0.0.1:${toString port}";
  };
}
