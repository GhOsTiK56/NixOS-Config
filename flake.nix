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

    tg-ws-proxy-src = {
      url = "github:Flowseal/tg-ws-proxy";
      flake = false;
    };
  };

  outputs = { nixpkgs, home-manager, tg-ws-proxy-src, zen-browser, ... }: {
    nixosConfigurations.NixOS = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/desktop
        home-manager.nixosModules.default
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit tg-ws-proxy-src zen-browser; };
            users.ghostik = ./home;
          };
        }
      ];
    };
  };
}