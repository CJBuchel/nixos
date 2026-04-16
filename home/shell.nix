{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      rebuild = "git -C ~/nixos-config add -A && sudo nixos-rebuild switch --flake ~/nixos-config#andromeda";
      rebuild-push = "rebuild && git -C ~/nixos-config push";
      reubild-clean = "sudo nix-collect-garbage -d && sudo nixos-rebuild boot --flake ~/nixos-config#andromeda";
      ls = "ls --color=auto";
      ll = "ls -lah --color=auto";
      nv = "nvim";
    };

    initContent = ''
      export PATH=$HOME/.cargo/bin:$PATH
    '';
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
