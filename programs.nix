{
  pkgs,
  inputs,
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
      export PATH="$PATH:${pkgs.jdk21}/bin:${pkgs.nodejs_22}/bin:/home/cedric/bin"
    '';
  };

  vscode = {
    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    extensions = with pkgs.vscode-extensions; [
      yzhang.markdown-all-in-one
      jnoortheen.nix-ide
      ms-azuretools.vscode-docker
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
    ];
    userSettings = {
      "workbench.colorTheme" = "Default Light Modern";
      "cSpell.language" = "pt-BR,en,pt";
      "files.autoSave" = "afterDelay";
    };
  };
  kitty = {
    enable = true;
    font = {
      name = "JetBrains Mono";
      size = 10;
    };
    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
      "ctrl+v" = "paste_from_clipboard";
      "ctrl+f>1" = "set_font_size 10";
      "ctrl+f>2" = "set_font_size 20";
      "ctrl+f>5" = "set_font_size 15";
      "ctrl+shift+o" = "launch --location=hsplit";
      "ctrl+shift+e" = "launch --location=vsplit";
      "ctrl+shift+k" = "launch --location=split";
      "ctrl+shift+j" = "layout_action rotate";
      "shift+up" = "move_window up";
      "shift+left" = "move_window left";
      "shift+right" = "move_window right";
      "shift+down" = "move_window down";
      "ctrl+shift+up" = "layout_action move_to_screen_edge top";
      "ctrl+shift+left" = "layout_action move_to_screen_edge left";
      "ctrl+shift+right" = "layout_action move_to_screen_edge right";
      "ctrl+shift+down" = "layout_action move_to_screen_edge bottom";
      "ctrl+left" = "neighboring_window left";
      "ctrl+right" = "neighboring_window right";
      "ctrl+up" = "neighboring_window up";
      "ctrl+down" = "neighboring_window down";
    };
    settings = {
      scrollback_lines = 20000;
      enable_audio_bell = false;
    };
  };

}
