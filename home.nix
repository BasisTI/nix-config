{
  config,
  pkgs,
  inputs,
  my_username,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  home = {
    username = "${my_username}";
    homeDirectory = "/home/${my_username}";
    stateVersion = "24.11";
    packages = with pkgs;
      import ./packages.nix {
        inherit pkgs;
        inherit inputs;
      };
    file = with config;
      import ./sdks.nix {
        inherit config;
        inherit pkgs;
      };
    sessionVariables = {
      EDITOR = "vim";
    };
  };
  programs = with pkgs;
    import ./programs.nix {
      inherit pkgs;
      inherit inputs;
    };
}
