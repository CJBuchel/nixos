{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      rebuild = "git -C ~/nixos-config add -A && sudo nixos-rebuild switch --flake ~/nixos-config#andromeda --impure";
      rebuild-push = "rebuild && git -C ~/nixos-config push";
      rebuild-clean = "sudo nix-collect-garbage -d && sudo nixos-rebuild boot --flake ~/nixos-config#andromeda --impure";
      ls = "ls --color=auto";
      ll = "ls -lah --color=auto";
      nv = "nvim";
      nix-shell = "nix shell --impure";
      nix-run = "nix run --impure";
      dev = "nix develop ~/nixos-config/devshell";
    };

    initContent = ''
    '';
  };

  home.sessionVariables = {
    NIXPKGS_ALLOW_UNFREE = "1";
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
      };
    };
  };
}
