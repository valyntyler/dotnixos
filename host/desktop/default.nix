{
  imports = [
    ./hardware-configuration.nix
    ../common/core
    ../common/optional/de/gnome
    ../common/optional/de/niri
    ../common/optional/dm/gdm
    ../common/optional/home-manager.nix
    ../common/optional/xdg.nix

    # hardware
    ../common/optional/hardware/graphics.nix
    ../common/optional/hardware/nvidia.nix

    # programs
    ../common/optional/programs/discord.nix
    ../common/optional/programs/localsend.nix
    ../common/optional/programs/spotify.nix
    ../common/optional/programs/steam.nix

    # services
    ../common/optional/services/collabora.nix
    ../common/optional/services/immich.nix
    ../common/optional/services/jellyfin.nix
    ../common/optional/services/minecraft.nix
    ../common/optional/services/nextcloud.nix
    ../common/optional/services/nginx.nix
    ../common/optional/services/qbittorrent.nix
    ../common/optional/services/qui.nix
    ../common/optional/services/syncthing.nix
    ../common/optional/services/transmission.nix
  ];

  system.stateVersion = "24.11";
}
