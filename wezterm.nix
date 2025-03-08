{ config, pkgs, ... }:

{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require "wezterm"
      local config = {}

      -- Appearance
      config.color_scheme = "Idle Toes (Gogh)"
      config.font_size = 14

      config.window_decorations = "RESIZE|INTEGRATED_BUTTONS"
      config.window_frame = {
        font_size = 13,
      }

      return config
    '';
  };
}
