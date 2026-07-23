{
  description = "ricevim";

  outputs = {self, ...} @ args: let
    inputs = ((import ./.tack) // {inherit self;}) {overrides = args.tackOverrides or {};};
    inherit (inputs) flake-parts;
  in
    flake-parts.lib.mkFlake {inherit inputs self;} {
      imports = [./parts];
    };
}
