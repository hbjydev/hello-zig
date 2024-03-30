{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = inputs.nixpkgs.lib.systems.flakeExposed;

      perSystem = { config, pkgs, ... }: {
        devShells.default = pkgs.mkShell {
          buildInputs = [ pkgs.zig ];
        };
      };
    };
}
