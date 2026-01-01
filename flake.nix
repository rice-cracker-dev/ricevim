{
  description = "ricevim";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-25-05.url = "github:NixOS/nixpkgs/nixos-25.05";
    mnw.url = "github:Gerg-L/mnw";

    # plugins
    ts-error-translator = {
      url = "github:dmmulroy/ts-error-translator.nvim";
      flake = false;
    };

    direnv-nvim = {
      url = "github:NotAShelf/direnv.nvim";
      flake = false;
    };
  };

  outputs = inputs @ {
    flake-parts,
    mnw,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];
      perSystem = {pkgs, ...}: let
        neovim = mnw.lib.wrap {inherit inputs pkgs;} ./nix;
      in {
        packages = {
          inherit neovim;
          inherit (neovim) devMode;

          default = neovim;
        };

        formatter = pkgs.writeShellApplication {
          name = "formatter";
          runtimeInputs = with pkgs; [stylua alejandra];
          text = ''
            stylua -v .
            alejandra .
          '';
        };

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [stylua alejandra];
        };
      };
    };
}
