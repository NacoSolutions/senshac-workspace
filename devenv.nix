{ pkgs, inputs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
  rn = inputs.roger-navelsaker.nixpkgs.${system};
in
{
  imports = [ /workspace/common/main/devenv.nix ];

  name = "senshac-workspace";

  packages = [
    rn.canopy
    rn.trellis
  ];

  enterShell = ''
    export PATH="$DEVENV_ROOT/scripts:$PATH"
  '';
}
