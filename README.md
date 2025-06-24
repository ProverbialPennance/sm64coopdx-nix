# sm64coopdx

Yet another package of [sm64coopdx](https://github.com/coop-deluxe/sm64coopdx).

The original upstream sm64coopdx [derivation](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/sm/sm64coopdx/package.nix) in [nixpkgs](https://github.com/NixOS/nixpkgs) relies on the presence of a Super Mario 64 baserom during build time. An outdated requirement which is no longer neccessary as of [this commit](https://github.com/coop-deluxe/sm64coopdx/commit/0810f013961fd71fe3de406a6c944b1f5492d2e1).

## Deprecation
DATE: `2025-06-24`
This repo is being archived, and is now managed under [just-one-more-repo](https://github.com/ProverbialPennance/just-one-more-repo)

## Installation

For a [flakes enabled system](https://nixos.wiki/wiki/flakes#Enable_flakes_permanently_in_NixOS), the following additions to a `flake.nix` in your system's configuration directory will add an overlay replacing the package in nixpkgs with this one.

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05"; # NOTE: replace nixos-25.05 with the desired version, such as nixos-unstable

    sm64coopdx = {
        url = "github:ProverbialPennance/sm64coopdx-nix";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    sm64coopdx,
  }:
  {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix
          sm64coopdx.nixosModules.default
        ];
      };
    };
  };
}
```

after which you can add the `sm64coopdx` to your configuration.nix as per usual:

```nix
{
  config,
  lib,
  pkgs,
  ...
}:
...
environment.systemPackages = [
  sm64coopdx
];
```
