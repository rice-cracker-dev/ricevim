{
  description = "ricevim";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    mnw.url = "github:Gerg-L/mnw";

    # lsps
    qml-language-server.url = "github:cushycush/qml-language-server";

    # plugins
    blink-cmp.url = "github:saghen/blink.cmp";
    blink-pairs.url = "github:saghen/blink.pairs";

    direnv-nvim = {
      url = "github:NotAShelf/direnv.nvim";
      flake = false;
    };

    opencode-nvim = {
      url = "github:sudo-tee/opencode.nvim";
      flake = false;
    };
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [./parts];
    };
}
