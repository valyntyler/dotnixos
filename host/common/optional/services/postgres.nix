{
  services.postgresql = {
    enable = true;
    port = 5432;
    enableJIT = true;
    enableTCPIP = false;
  };
}
