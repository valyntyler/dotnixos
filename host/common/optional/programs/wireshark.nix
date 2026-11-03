{
  pkgs,
  user,
  ...
}: {
  users.extraGroups.wireshark.members = [user];
  programs.wireshark = {
    enable = true;
    dumpcap.enable = true;
    usbmon.enable = true;
  };
  environment.systemPackages = with pkgs; [
    termshark
    wireshark
  ];
  services.udev.extraRules = ''
    SUBSYSTEM=="usbmon", GROUP="wireshark", MODE="0640"
  '';
}
