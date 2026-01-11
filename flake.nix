{
  description = "Adv360 Pro ZMK Keyboard Firmware Build Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            gnumake
          ];

          # Überschreibe DOCKER mit sudo docker für die Makefile
          shellHook = ''
            export DOCKER="sudo /run/current-system/sw/bin/docker"
            echo "ZMK Build Environment aktiviert"
            echo "DOCKER=$DOCKER"
          '';
        };
      }
    );
}

