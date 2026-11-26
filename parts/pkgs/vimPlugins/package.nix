{
  lib,
  inputs,
  pkgs,
  vimPlugins,
}: let
  inherit (vimPlugins) plenary-nvim;
  inherit (import ./utils.nix {inherit lib inputs pkgs;}) buildPlugins getPluginSourcesFromPins;
in
  buildPlugins (
    getPluginSourcesFromPins (fromTOML (builtins.readFile ../../../.tack/pins.toml)).inputs
  ) {
    neonuget.dependencies = [plenary-nvim];
  }
