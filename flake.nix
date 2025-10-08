{
  description = "Sumner Evans' Resume";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    typix = {
      url = "github:loqusion/typix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs@{ nixpkgs, typix, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        inherit (pkgs) lib;

        typixLib = typix.lib.${system};

        src = typixLib.cleanTypstSource ./.;
        commonArgs = {
          typstSource = "resume.typ";

          fontPaths = [
            # Add paths to fonts here
            "${pkgs.iosevka}/share/fonts/truetype"
            "."
          ];

          virtualPaths = [{ src = ./fonts/tabler-icons.ttf; }];
        };

        unstable_typstPackages = [{
          name = "use-tabler-icons";
          version = "0.15.0";
          hash = "sha256-vtZwe0+wHHXlZF0+wQazsdJSkLDS1WzN16QfSXZR2U0=";
        }];

        # Compile a Typst project, *without* copying the result
        # to the current directory
        build-drv = typixLib.buildTypstProject
          (commonArgs // { inherit src unstable_typstPackages; });

        # Compile a Typst project, and then copy the result
        # to the current directory
        build-script = typixLib.buildTypstProjectLocal
          (commonArgs // { inherit src unstable_typstPackages; });

        # Watch a project and recompile on changes
        watch-script = typixLib.watchTypstProject commonArgs;
      in {
        checks = { inherit build-drv build-script watch-script; };

        packages.default = build-drv;

        apps = rec {
          default = watch;
          build = flake-utils.lib.mkApp { drv = build-script; };
          watch = flake-utils.lib.mkApp { drv = watch-script; };
        };

        devShells.default = typixLib.devShell {
          inherit (commonArgs) fontPaths virtualPaths;
          packages = [ watch-script ];
        };
      });
}
