{
  description = "NixOS desktop configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
    
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    freesmlauncher = {
      url = "github:FreesmTeam/FreesmLauncher";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zapret-src = {
      url = "github:Sergeydigl3/zapret-discord-youtube-linux";
      flake = false;
    };

    tg-ws-proxy-src = {
      url = "github:Flowseal/tg-ws-proxy";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    zen-browser,
    zapret-src,
    tg-ws-proxy-src,
    freesmlauncher,
    ...
  }: {
    nixosConfigurations.NixOS = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = {
        inherit zapret-src tg-ws-proxy-src;
      };

      modules = [
        ./hosts/desktop
        home-manager.nixosModules.default
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit zen-browser freesmlauncher; };
            users.ghostik = ./home;
          };
        }
      ];
    };
  };
}