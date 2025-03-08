{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    sessionVariables = {
      EDITOR = "hx";
      VISUAL = "$EDITOR";
      FOO = "bar";
    };
    shellAliases = {
      ls = "eza --icons=always --group-directories-first";
      hme = "home-manager edit";
      hms = "home-manager switch";
    };
    bashrcExtra = ''
      magenta="\[\e[35m\]"
      cyan="\[\e[36m\]"
      yellow="\[\e[33m\]"
      reset_color="\[\e[0m\]"

      # Extract the current git branch for pretty-printing if
      # one exists.
      parse_git_branch() {
        git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
      }

      # Still needs git branch information!
      export PS1="''${magenta}\u''${reset_color}''${yellow}\$(parse_git_branch)''${reset_color} : ''${cyan}\W''${reset_color} \$ "
    '';
  };
}
