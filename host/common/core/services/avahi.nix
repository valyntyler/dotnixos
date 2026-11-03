{
  services.avahi = {
    enable = true;
    openFirewall = true;
    nssmdns4 = true;
    nssmdns6 = true;
    settings.publish = {
      "disable-publishing" = false;
      addresses = true;
      workstation = true;
    };
  };
}
