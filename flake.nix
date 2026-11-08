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

    # These repositories are source inputs, not independent Nix flakes.
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
    nixpkgs,
    home-manager,
    zen-browser,
    freesmlauncher,
    zapret-src,
    tg-ws-proxy-src,
    ...
  }: {
    nixosConfigurations.NixOS = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      # Pass source repositories to the system modules that run them as services.
      specialArgs = {
        inherit zapret-src tg-ws-proxy-src;
      };

      modules = [
        ./hosts/desktop
        home-manager.nixosModules.default
        {
          home-manager = {
            # Reuse the system's nixpkgs instance and install HM packages system-wide.
            useGlobalPkgs = true;
            useUserPackages = true;

            # Pass flake inputs to Home Manager modules that need external packages.
            extraSpecialArgs = {
              inherit zen-browser freesmlauncher;
            };

            users.ghostik = ./home;
          };
        }
      ];
    };
  };
}