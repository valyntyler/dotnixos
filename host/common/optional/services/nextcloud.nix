# Original config by @bartoostveen, modified to suit my needs
{
  pkgs,
  config,
  ...
}: let
  domain = "cloud.valyntyler.com";
in {
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud33;
    hostName = domain;
    config = {
      adminpassFile = config.sops.secrets."nextcloud/admin/pass".path;
      dbtype = "pgsql";
    };
    database.createLocally = true;
    configureRedis = true;
    https = true;
    maxUploadSize = "5G";
    phpOptions = {
      "opcache.memory_consumption" = "128";
      "opcache.interned_strings_buffer" = "25";
      "opcache.max_accelerated_files" = "4000";
      "opcache.revalidate_freq" = "60";
      "opcache.enable_cli" = "1";
    };
    extraApps = {
      inherit
        (pkgs.nextcloud33Packages.apps)
        bookmarks
        calendar
        contacts
        cookbook
        gpoddersync
        news
        nextpod
        notes
        repod
        richdocuments
        tasks
        ;
    };
    extraAppsEnable = true;
  };
  services.nginx.virtualHosts.${domain} = {
    forceSSL = true;
    enableACME = true;
  };
  # initial admin password
  sops.secrets."nextcloud/admin/pass".owner = "nextcloud";
}
