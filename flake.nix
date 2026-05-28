{
  description = "ricevim";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable-small";
    mnw.url = "github:Gerg-L/mnw";

    # lsps
    qml-language-server.url = "github:cushycush/qml-language-server";

    # plugins
    blink-cmp.url = "github:saghen/blink.cmp";
    blink-cmp.inputs.nixpkgs.follows = "nixpkgs";
    blink-pairs.url = "github:saghen/blink.pairs";
    blink-pairs.inputs.nixpkgs.follows = "nixpkgs";

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
