{
  inputs,
  self,
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
    neovim = inputs.mnw.lib.wrap {inherit inputs inputs' self' pkgs system;} ./nvim;
  in {
    packages = {
      inherit neovim;
      inherit (neovim) devMode;

      default = neovim;
    };
  };

  flake.hydraJobs = {
    neovim = mkHydraPackage "neovim" ["x86_64-linux" "aarch64-linux"];
  };
}
