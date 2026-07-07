{
  description = "ricevim";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable-small";
    mnw.url = "github:Gerg-L/mnw";

    # plugins
    blink-cmp.url = "github:saghen/blink.cmp";
    blink-cmp.inputs.nixpkgs.follows = "nixpkgs";
    blink-pairs.url = "github:saghen/blink.pairs";
    blink-pairs.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [./parts];
    };
}
