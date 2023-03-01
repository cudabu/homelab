# https://status.nixos.org (nixpkgs-unstable)
{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/e58a7747db96c23b8a977e7c1bbfc5753b81b6fa.tar.gz") {} }:

let
  python-packages = pkgs.python3.withPackages (p: with p; [
    jinja2
    kubernetes
    netaddr
    rich
  ]);
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    age
    ansible
    ansible-lint
    direnv
    fluxcd
    go-task
    kubernetes-helm
    ipcalc
    jq
    haskellPackages.kubernetes-client
    kustomize
    pre-commit
    nodePackages_latest.prettier
    sops
    stern
    terraform
    tflint
    gitops
    yamllint
    yq

  ];
}
