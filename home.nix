{ config, pkgs, ... }:

{
  imports = [
    ./.private.nix
    ./bash.nix
    ./helix.nix
    ./wezterm.nix
  ];

  home.stateVersion = "25.05";

  # Packages which will be installed in your environment.
  home.packages = [
    pkgs.bat
    pkgs.docker
    pkgs.eza
    pkgs.flann
    pkgs.git
    pkgs.helix
    pkgs.hello
    pkgs.just
    # pkgs.mypy
    pkgs.nil
    pkgs.nixd
    pkgs.nixpkgs-fmt
    pkgs.postgresql
    pkgs.pyright
    pkgs.python312
    pkgs.python312Packages.python-lsp-server
    # pkgs.python312Packages.pylsp-mypy
    pkgs.ripgrep
    pkgs.ruff
    pkgs.rustup # Installs cargo, rustc, rust-analyzer, etc.
    pkgs.tree
    pkgs.uv

    (pkgs.writeShellScriptBin "hm-test" ''
      echo "${pkgs.python312}"
    '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = { };

  programs.home-manager.enable = true;

}
