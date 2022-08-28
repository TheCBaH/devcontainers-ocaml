#!/bin/sh
set -eu
set -x
username=${USERNAME}
su -l $username -c sh <<_EOS_
set -eu
set -x
ocaml --version
opam install -y\
 ${OCAML_PACKAGES:-utop} \

opam clean
_EOS_
