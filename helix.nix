{ config, pkgs, ... }:

{
  programs.helix = {
    enable = true;

    extraPackages = [

    ];

    settings = {
      theme = "monokai_pro_spectrum";
      editor = {
        bufferline = "always";
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        file-picker = {
          hidden = false;
        };
        soft-wrap = {
          enable = true;
          wrap-indicator = " ";
        };
        statusline = {
          right = [
            "version-control"
            "diagnostics"
            "selections"
            "register"
            "position"
            "file-encoding"
          ];
        };
      };

      keys = {
        insert = {
          "C-[" = "normal_mode";
        };
      };
    };

    languages = {
      language = [
        {
          name = "markdown";
          text-width = 80;
          soft-wrap.wrap-at-text-width = true;
        }
        {
          name = "nix";
          auto-format = true;
          language-servers = [ "nixd" "nil" ];
          formatter.command = "nixpkgs-fmt";
        }
        {
          name = "python";
          # language-servers = ["ruff" "pylsp"];
          language-servers = [ "ruff" "pyright" "pylsp" ];
          auto-format = true;
        }

        # Javascript/Typescript
        {
          name = "javascript";
          formatter = {
            command = "prettierd";
            args = [ ".js" ];
          };
          auto-format = true;
        }
        {
          name = "typescript";
          formatter = {
            command = "prettierd";
            args = [ ".ts" ];
          };
          auto-format = true;
        }
        {
          name = "jsx";
          formatter = {
            command = "prettierd";
            args = [ ".jsx" ];
          };
          auto-format = true;
        }
        {
          name = "tsx";
          formatter = {
            command = "prettierd";
            args = [ ".tsx" ];
          };
          auto-format = true;
        }
      ];

      language-server = {
        ruff = {
          command = "ruff";
          args = [ "server" ];
        };

        # pylsp = {
        #   config.pylsp.plugins.pylsp_mypy = {
        #     enabled = true;
        #     live_mode = true;
        #   };
        # };

        pyright = {
          config.python.analysis.typeCheckingMode = "basic";
        };
      };
    };
  };

}
