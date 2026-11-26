{
  inputs,
  self,
  lib,
  ...
}: let
  mkHydraPackage = packageName: systems:
    builtins.listToAttrs (map (system: {
        name = system;
        value = self.packages.${system}.${packageName};
      })
      systems);
in {
  perSystem = {
    pkgs,
    inputs',
    self',
    system,
    ...
  }: let
    inherit (lib) callPackageWith packagesFromDirectoryRecursive;

    neovim = inputs.mnw.lib.wrap {inherit inputs inputs' self' pkgs system;} ./nvim;

    callPackage = callPackageWith (pkgs // {inherit inputs;});
  in {
    packages = {
      inherit neovim;
      inherit (neovim) devMode;

      default = neovim;
    };

    legacyPackages = packagesFromDirectoryRecursive {
      inherit callPackage;
      directory = ./pkgs;
    };
  };

  flake.hydraJobs = {
    neovim = mkHydraPackage "neovim" ["x86_64-linux" "aarch64-linux"];
  };
}
