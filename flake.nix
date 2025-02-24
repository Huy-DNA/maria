{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShell = pkgs.mkShell {
        packages = with pkgs; [
          python27
          python27Packages.distutils
          neovim
          xorg.libX11
          xorg.libXmu
          mesa
          gl2ps
          xorg.libXi
          libpng
          libpng.dev
          gnutls
          curl
          curl.dev
          fontconfig
          sqlite
          sqlite.dev
          glew
          glew.dev
          openssl
          gtk3
          binutils
          pkg-config
          zlib
          zlib.dev
          glfw3
          xorg.libXxf86vm
        ];
      };
    });
}
