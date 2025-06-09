{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    systems = [
      "x86_64-linux"
      "x86_64-darwin"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    packages = forAllSystems (system: rec {
      sm64coopdx = nixpkgs.legacyPackages.${system}.callPackage ./sm64coopdx {};
      default = sm64coopdx;
    });

    overlays.default = import ./overlay.nix;
    nixosModules.default = import ./module.nix;
  };
}
