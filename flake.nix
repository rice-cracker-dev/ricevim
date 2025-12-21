{
  description = "ricevim";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    mnw.url = "github:Gerg-L/mnw";
  };

  outputs = inputs @ {
    flake-parts,
    mnw,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];
      perSystem = {pkgs, ...}: let
        neovim =
          mnw.lib.wrap {
            inherit inputs pkgs;
          }
          ./nix;
      in {
        packages = {
          inherit neovim;
          inherit (neovim) devMode;

          default = neovim;
        };
      };
    };
}
