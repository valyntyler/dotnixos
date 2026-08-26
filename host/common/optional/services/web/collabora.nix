{
  services.collabora-online = {
    enable = true;
    settings = {
      net.listen = "127.0.0.1";
      ssl = {
        termination = true;
        enable = false;
      };
    };
  };
}
