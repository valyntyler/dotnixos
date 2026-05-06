{
  description = "My custom NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    # nixpkgs-termshark.url = "github:amarshall/nixpkgs/termshark-fix-dumpcap-wrapper";
    nixpkgs-yazi-flavors.url = "github:valyntyler/nixpkgs/yazi-flavors";

    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:valyntyler/nixos-hardware/master";

    # nix-auth.url = "github:numtide/nix-auth";

    musnix.url = "github:musnix/musnix";
    musnix.inputs.nixpkgs.follows = "nixpkgs";

    lanzaboote.url = "github:nix-community/lanzaboote/v1.0.0";

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    nvf.url = "github:valyntyler/nvf";

    flint.url = "github:notashelf/flint";
    flint.inputs.nixpkgs.follows = "nixpkgs";

    qbitwebui.url = "github:valyntyler/qbitwebui";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";

    gurk.url = "github:valyntyler/gurk-rs";

    # import zen browser flake
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.inputs.home-manager.follows = "home-manager";

    # import firefox runner
    wofizilla.url = "github:valyntyler/wofizilla";
    wofizilla.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    flake-parts,
    home-manager,
    nixos-hardware,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];
      imports = [
        ./systems/desktop.nix
        ./systems/frame12.nix
        ./systems/ideapad.nix
      ];
    };
}
