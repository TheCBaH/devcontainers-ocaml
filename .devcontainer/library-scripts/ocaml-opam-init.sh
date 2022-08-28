#!/bin/sh
set -eu
set -x
username=${USERNAME}
su -l $username -c "env OCAML_VERSION=${OCAML_VERSION:-4.14.0} sh" <<'_EOS_'
set -eu
set -x
opam init --disable-sandboxing -a
opam switch create ${OCAML_VERSION}
eval $(opam config env)
which ocaml;ocaml -version
opam install -y \
 dune\
 ocaml-lsp-server\
 ocamlformat\
_EOS_