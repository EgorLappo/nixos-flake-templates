{
  description = "pixi env";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };
  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        fhs = pkgs.buildFHSEnv {
          name = "pixi";
          targetPkgs = _: [ pkgs.pixi ];

          runScript = "fish";
        };
      in
      {
        devShell = fhs.env // {
          name = "pixi";
        };
      }
    );
}
