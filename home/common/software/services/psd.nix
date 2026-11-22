{
  services.psd = {
    enable = true;
    useBackup = true;
    backupLimit = 5;
    resyncTimer = "30min";
    browsers = [
      "epiphany"
      "firefox"
    ];
  };
}
