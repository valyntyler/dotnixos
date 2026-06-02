{
  nix.settings = {
    auto-optimise-store = true;

    # Enable flakes and nix command
    experimental-features = ["nix-command" "flakes"];

    # Add binary cache
    trusted-substituters = [
      "https://nix-community.cachix.org"
      "https://nix-gaming.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
    ];

    # Increase download size
    download-buffer-size = 524288000;
  };
}
