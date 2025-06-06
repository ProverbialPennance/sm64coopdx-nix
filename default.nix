{pkgs ? import <nixpkgs> {}, ...}: {
  sm64coopdx = pkgs.callPackage ./sm64coopdx {};
}
