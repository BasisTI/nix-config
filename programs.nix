{
  pkgs,
  ...
}:
{
  home-manager.enable = true;
  direnv.enable = true;
  bash = {
    enable = false;
    initExtra = ''
      export EDITOR="nvim"
      export JAVA_HOME="${pkgs.jdk21}/lib/openjdk"
      export PATH="$PATH:${pkgs.jdk21}/bin:${pkgs.nodejs_22}/bin:/home/basis/bin"
    '';
  };

  vscode = {
    enable = true;
    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      extensions = with pkgs.vscode-extensions; [
        yzhang.markdown-all-in-one
        jnoortheen.nix-ide
        ms-azuretools.vscode-docker
        ms-kubernetes-tools.vscode-kubernetes-tools
        tamasfe.even-better-toml
        redhat.vscode-yaml
        redhat.vscode-xml
        asciidoctor.asciidoctor-vscode
        ms-python.python
        ms-python.pylint
        ms-python.vscode-pylance
        ms-python.debugpy
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-containers
        angular.ng-template
        charliermarsh.ruff
        jebbs.plantuml
      ];
      userSettings = {
        "workbench.colorTheme" = "Default Light Modern";
        "cSpell.language" = "pt-BR,en,pt";
        "files.autoSave" = "afterDelay";
        "ruff.nativeServer" = "on";
        "ruff.path" = [ "/home/basis/.nix-profile/bin/ruff" ];
      };
    };
  };
  nvchad = {
    enable = true;
    extraPackages = with pkgs; [
      nodePackages.bash-language-server
      docker-compose-language-service
      dockerfile-language-server-nodejs
      emmet-language-server
      vscode-langservers-extracted
      nixd
      (python3.withPackages (
        ps: with ps; [
          python-lsp-server
          pyright
          flake8
        ]
      ))
    ];
    extraPlugins = ''
      return 
      {
        { 
        'javiorfo/nvim-soil',
          dependencies = { 'javiorfo/nvim-nyctophilia' },
          lazy = true,
          ft = "plantuml",
          opts = {
              actions = {
                  redraw = true
              },
              puml_jar = "/home/cedric/tools/plantuml/plantuml-asl-1.2025.2.jar",
              image = {
                  darkmode = false, -- Enable or disable darkmode
                  format = "png", -- Choose between png or svg
                  execute_to_open = function(img)
                      return "nsxiv --scale-mode f −−anti−alias=yes -b " .. img
                  end
              }
            }
        }, 
        {'terrastruct/d2-vim'}
       }
    '';
    extraConfig = '''';
    hm-activation = true;
    backup = false;
  };
  nix-init.enable = true;
}
