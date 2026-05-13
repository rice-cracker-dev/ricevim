{
  pins,
  self',
  lib,
  ...
}: let
  inherit (lib) mapAttrsToList concatStringsSep;

  luaPinPath = mapAttrsToList (pin: path: "[\"${pin}\"]=\"${path}\"") pins;
in {
  imports = [
    ./binaries.nix
    ./plugins.nix
  ];

  appName = "ricevim";
  aliases = ["vim" "vi"];

  plugins.dev.ricevim = {
    pure = ../../nvim;
    impure = "~/projects/ricevim/nvim";
  };

  initLua =
    # lua
    ''
      vim.g.pins = {${concatStringsSep "," luaPinPath}}
      vim.g.hyprland_stub = "${self'.packages.hyprland-lua-stub}/share/hypr/stubs";

      require('core')
    '';
}
