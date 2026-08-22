{lib, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../common/core
    ../common/optional/de/gnome
    ../common/optional/dm/gdm
    ../common/optional/home-manager.nix
    ../common/optional/musnix.nix
    ../common/optional/nix-auth.nix
    ../common/optional/xdg.nix
    ../common/optional/hardware/graphics.nix

    # programs
    ../common/optional/programs/appimage.nix
    ../common/optional/programs/discord.nix
    ../common/optional/programs/gamemode.nix
    ../common/optional/programs/gamescope.nix
    ../common/optional/programs/java.nix
    ../common/optional/programs/localsend.nix
    ../common/optional/programs/nix-ld.nix
    ../common/optional/programs/spotify.nix
    ../common/optional/programs/steam.nix
    ../common/optional/programs/wireshark.nix

    # services
    ../common/optional/services/kanata.nix
    ../common/optional/services/pipewire.nix
    ../common/optional/services/postgres.nix
    ../common/optional/services/syncthing.nix

    # virtualization
    ../common/optional/virt/docker.nix
    ../common/optional/virt/podman.nix
    ../common/optional/virt/virtd.nix
  ];

  system.stateVersion = "25.11";

  services.fwupd.enable = lib.mkForce false;
}
