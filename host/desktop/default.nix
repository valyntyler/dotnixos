{inputs, ...}: {
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
    ../common/optional/services/slskd.nix
    ../common/optional/services/syncthing.nix
    ../common/optional/services/transmission.nix
  ];

  system.stateVersion = "24.11";

  ## container stuff

  networking.nat = {
    enable = true;
    # Use "ve-*" when using nftables instead of iptables
    internalInterfaces = ["ve-+"];
    externalInterface = "ens3";
    # Lazy IPv6 connectivity for the container
    enableIPv6 = true;
  };

  services.nginx.virtualHosts."frigginfrogs.gay" = {
    forceSSL = true;
    enableACME = true;
    locations."/".proxyPass = "http://192.168.100.11";
  };

  ## more container stuff

  containers.make = {
    autoStart = true;
    privateNetwork = true;
    hostAddress = "192.168.100.20";
    localAddress = "192.168.100.21";
    config = inputs.make-infra.nixosModules.default;
  };

  services.nginx.virtualHosts."valyn.eu" = {
    forceSSL = true;
    enableACME = true;
    locations."/".proxyPass = "http://192.168.100.21";
  };
}
