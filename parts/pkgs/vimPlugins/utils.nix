{
  lib,
  pkgs,
  inputs,
}: let
  inherit (lib) pipe filterAttrs mapAttrs;
  inherit (pkgs.vimUtils) buildVimPlugin;
in {
  buildPlugins = sources: attrs:
    mapAttrs (name: src:
      buildVimPlugin ({
          inherit name src;
        }
        // (attrs.${name} or {})))
    sources;

  getPluginSourcesFromPins = pins:
    pipe pins [
      (filterAttrs (_: pin: (pin ? group) && pin.group == "plugin"))
      (mapAttrs (name: _: inputs.${name}))
    ];
}
