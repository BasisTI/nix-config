{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvchad-starter = {
      url = "github:cedric-lamalle/nvchad-starter";
      flake = false;
    };
    nix4nvchad = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nvchad-starter.follows = "nvchad-starter";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      my_username = "basis";
      pkgs = nixpkgs.legacyPackages.${system};
      inherit inputs;
    in
    {
      homeConfigurations.${my_username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ 
          ./home.nix 
          inputs.nix4nvchad.homeManagerModule
          ];
        extraSpecialArgs = {
          inherit inputs;
          inherit my_username;
        };
      };
    };
}
