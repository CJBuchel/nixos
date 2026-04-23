{
  description = "Global dev shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        fhs = pkgs.buildFHSEnv {
          name = "dev";

          targetPkgs = pkgs: with pkgs; [
            # Rust
            rustup
            pkg-config
            openssl
            openssl.dev

            # Protobuf
            protobuf

            # General dev tools
            pre-commit
            python3
            nodejs
            git
            curl
            wget
            unzip
            which
            bash
            jq

            # Build essentials
            gcc
            gnumake
            cmake

            # System libs for Flutter/GUI apps
            glib
            gtk3
            cairo
            pango
            gdk-pixbuf
            harfbuzz
            expat
            libdrm
            mesa
            libGL
            zlib
            xz
            at-spi2-core
          ];

          runScript = pkgs.writeScript "dev-shell" ''
            #!${pkgs.bash}/bin/bash

            export RUSTUP_HOME=$HOME/.rustup
            export CARGO_HOME=$HOME/.cargo
            export PATH=$CARGO_HOME/bin:$PATH

            export PUB_CACHE=$HOME/.pub-cache

            # Flutter SDK wiring
            export FLUTTER_HOME=$HOME/develop/flutter
            export PATH=$FLUTTER_HOME/bin:$PUB_CACHE/bin:$PATH

            export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath [
              pkgs.glib pkgs.gtk3
            ]}:$LD_LIBRARY_PATH

            exec ${pkgs.zsh}/bin/zsh
          '';

        };

      in {
        devShells.default = pkgs.mkShell {
          buildInputs = [ fhs ];
          shellHook = ''
            exec ${fhs}/bin/dev
          '';
        };
      }
    );
}
