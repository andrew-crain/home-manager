Nix home manager configuration.

Managing your environment this way requires [Home Manager](https://nix-community.github.io/home-manager/index.xhtml) and [Nix](https://nixos.org/).

# Quickstart

1. [Install Nix](https://nixos.org/download/).
2. [Install Home Manager](https://nix-community.github.io/home-manager/index.xhtml#ch-installation).
3. Clone this repository into `~/.config/home-manager/`.
4. Add a `.private.nix` file containing your user account and home directory.
5. Run `home-manager switch`.

The `.private.nix` file should look like this.

```nix
{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "my-username";
  home.homeDirectory = "/my/home/directory";
}
```

# Motivations

- Manage things in one place. Less mental load.
- Reproducability. Less fiddling, more doing.
- Templating.
