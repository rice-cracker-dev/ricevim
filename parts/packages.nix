{
  inputs,
  pins,
  ...
}: {
  perSystem = {
    pkgs,
    inputs',
    self',
    lib,
    ...
  }: let
    inherit (lib) packagesFromDirectoryRecursive callPackageWith;

    callPackage = callPackageWith (pkgs // {inherit inputs pins;});
    neovim = inputs.mnw.lib.wrap {inherit inputs inputs' self' pkgs pins;} ./nvim;
  in {
    packages =
      {
        inherit neovim;
        inherit (neovim) devMode;

        default = neovim;
      }
      // (packagesFromDirectoryRecursive {
        inherit callPackage;
        directory = ./pkgs;
      });
  };
}
