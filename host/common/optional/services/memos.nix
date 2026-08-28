{config, ...}: let
  domain = "notes.valyntyler.com";
  port = 5230;
in {
  services.memos = {
    enable = true;
    settings = {
      MEMOS_MODE = "prod";
      MEMOS_ADDR = "127.0.0.1";
      MEMOS_PORT = toString port;
      MEMOS_DATA = config.services.memos.dataDir;
      MEMOS_DRIVER = "sqlite";
      MEMOS_INSTANCE_URL = "http://localhost:" + toString port;
    };
  };
  services.nginx.virtualHosts.${domain} = {
    forceSSL = true;
    enableACME = true;
    locations."/".proxyPass = "http://127.0.0.1:" + toString port;
  };
}
