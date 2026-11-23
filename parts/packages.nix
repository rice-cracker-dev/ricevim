{inputs, ...}: {
  perSystem = {
    pkgs,
    inputs',
    self',
    system,
    # lib,
    ...
  }: let
    # inherit (lib) packagesFromDirectoryRecursive callPackageWith;
    # callPackage = callPackageWith (pkgs // {inherit inputs;});
    neovim = inputs.mnw.lib.wrap {inherit inputs inputs' self' pkgs system;} ./nvim;
  in {
    packages = {
      inherit neovim;
      inherit (neovim) devMode;

      default = neovim;
    };

    hydraJobs = {
      inherit (self'.packages) default;
    };
    # // (packagesFromDirectoryRecursive {
    #   inherit callPackage;
    #   directory = ./pkgs;
    # });
  };
}
