{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    ansible
  ];
  shellHook = ''
    fish -C "setenv ANSIBLE_ROLES_PATH $PWD/roles"
  '';
}
