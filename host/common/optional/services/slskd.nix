{config, ...}: {
  services.slskd = {
    enable = true;
    openFirewall = true;
    environmentFile = config.sops.secrets."slskd/env".path;
    domain = "slskd.valyntyler.com";
    nginx = {
      addSSL = true;
      onlySSL = true;
      forceSSL = true;
    };
  };
  sops.secrets."slskd/env" = {
    owner = "slskd";
    restartUnits = ["slskd.service"];
  };
}
