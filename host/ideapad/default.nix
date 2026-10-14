{lib, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../common/core
    ../common/optional/de/gnome
    ../common/optional/dm/gdm
    ../common/optional/home-manager.nix
    ../common/optional/xdg.nix
    ../common/optional/hardware/graphics.nix
    ../common/optional/hardware/nvidia.nix
    ../common/optional/programs/appimage.nix
    ../common/optional/programs/discord.nix
    ../common/optional/programs/gamemode.nix
    ../common/optional/programs/gamescope.nix
    ../common/optional/programs/java.nix
    ../common/optional/programs/localsend.nix
    ../common/optional/programs/nix-ld.nix
    ../common/optional/programs/spotify.nix
    ../common/optional/programs/steam.nix
    ../common/optional/services/app/kanata.nix
    ../common/optional/services/app/flatpak.nix
    ../common/optional/virt/docker.nix
    ../common/optional/virt/virtd.nix
  ];

  system.stateVersion = "24.05";

  # Secure boot
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };

  # Dual GPU
  hardware.nvidia.prime.offload = {
    enable = true;
    enableOffloadCmd = true;
    offloadCmdMainProgram = "gpu-offload";
  };
}
