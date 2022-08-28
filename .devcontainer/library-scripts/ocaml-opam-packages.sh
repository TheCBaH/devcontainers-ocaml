#!/bin/sh
set -eu
set -x
username=${USERNAME}
su -l $username -c sh <<'_EOS_'
set -eu
set -x
env
opam init --disable-sandboxing -a
opam switch create 4.12.1
eval $(opam config env)
which ocaml;ocaml -version
opam install -y dune
_EOS_
