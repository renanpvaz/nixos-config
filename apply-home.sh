#!/bin/sh
pushd ~/.config/nixos-config
home-manager switch -f ./home/home.nix
popd
