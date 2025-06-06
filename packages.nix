{pkgs, inputs, ...}:

with pkgs; [
    zip
    xz
    unzip
    p7zip
    oh-my-posh
    inputs.zen-browser.packages."${system}".beta
    pkgs.bat
    pkgs.maven
    pkgs.gradle
    pkgs.difftastic
    pkgs.graphviz
    pkgs.dbeaver-bin
    pkgs.chromium
    pkgs.lens
    pkgs.fzf
    pkgs.eza
    pkgs.gimp
    pkgs.remmina
    pkgs.dive
    pkgs.chromedriver
    file
    helix
    guvcview
    uvcdynctrl
    nvd
    ferdium
    pluto
    bruno
    devpod
    devpod-desktop
    nixfmt-rfc-style
    gnome-font-viewer
    lunarvim
    neovim
    ripgrep
    lazygit
    lemminx
    obsidian
    devcontainer
    neofetch
    jetbrains.idea-community
    git 
    warp-terminal
    uv
    ruff
    ruff-lsp
  ]
