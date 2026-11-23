{
  inputs,
  self,
  ...
}: {
  perSystem = {
    pkgs,
    inputs',
    self',
    system,
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
  };

  flake.hydraJobs = {
    inherit (self.packages) neovim;
  };
}
