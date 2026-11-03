{
  config,
  lib,
  ...
}: let
  inherit (lib) mkOption listToAttrs map;
  inherit (lib.types) functionTo anything;
  inherit (lib.generators) toLua;
in {
  imports = [
    ./binaries.nix
    ./plugins.nix
  ];

  options.luaGenerator = mkOption {
    type = functionTo anything;
    default = toLua {};
    readOnly = true;
  };

  config = {
    appName = "ricevim";
    aliases = ["vim" "vi"];

    plugins.dev.ricevim = {
      pure = ../../nvim;
      impure = "~/projects/ricevim/nvim";
    };

    initLua = let
      extraBinariesAttrs = listToAttrs (map (pkg: {
          name = pkg.pname;
          value = pkg;
        })
        config.extraBinaries);
    in
      # lua
      ''
        vim.g.binaries_table = ${config.luaGenerator extraBinariesAttrs}

        require('core')
      '';
  };
}
