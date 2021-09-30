#!/bin/sh
pushd ~/.dotfiles
home-manager switch -f ./home/home.nix
popd
