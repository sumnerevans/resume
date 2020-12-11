let
  pkgs = import <nixpkgs> {};

  # CoC Config
  cocConfig = pkgs.writeText "coc-settings.json" (
    builtins.toJSON (
      {
        "texlab.path" = "${pkgs.texlab}/bin/texlab";
      }
    )
  );
in
  pkgs.mkShell {
    shellHook = ''
      mkdir -p .vim
      ln -sf ${cocConfig} .vim/coc-settings.json
    '';

    buildInputs = with pkgs; [
      gnumake
      rnix-lsp
      texlab
      texlive.combined.scheme-full
    ];
  }
