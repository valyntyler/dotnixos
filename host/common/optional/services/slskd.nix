{config, ...}: {
  services.slskd = {
    enable = true;
    openFirewall = true;
    environmentFile = config.sops.secrets."slskd/env".path;
    domain = "slskd.valyntyler.com";
  };
  sops.secrets."slskd/env" = {
    owner = "slskd";
    restartUnits = ["slskd.service"];
  };
}
