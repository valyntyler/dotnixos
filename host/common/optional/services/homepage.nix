let
  listenPort = 8082;
in {
  services.homepage-dashboard = {
    inherit listenPort;
    enable = true;
    openFirewall = true;
    allowedHosts = "dash.valyntyler.com";
    widgets = [
      {
        greeting = {
          text_size = "xl";
          text = "Hello, world!";
        };
      }
      {
        datetime = {
          text_size = "xl";
          format = {timeStyle = "short";};
        };
      }
      {
        search = {
          provider = "duckduckgo";
          target = "_blank";
        };
      }
    ];
  };
  services.nginx.virtualHosts."dash.valyntyler.com" = {
    forceSSL = true;
    enableACME = true;
    locations."/".proxyPass = "http://127.0.0.1:${toString listenPort}";
  };
}
