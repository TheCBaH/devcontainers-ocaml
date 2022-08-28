ARG VARIANT=ubuntu-20.04
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}
COPY library-scripts/ocaml-opam.sh /tmp/library-scripts/
RUN set -eux;\
 sh /tmp/library-scripts/ocaml-opam.sh;\
 apt-get clean -y;rm -rf /var/lib/apt/lists/* /tmp/library-scripts\
 echo DONE
COPY library-scripts/ocaml-opam-init.sh /tmp/library-scripts/
ARG USERNAME=vscode
RUN set -exu;\
 sh /tmp/library-scripts/ocaml-opam-init.sh;\
 apt-get clean -y;rm -rf /var/lib/apt/lists/* /tmp/library-scripts\
 echo DONE
RUN set -exu;\
  env;\
  ls -al /tmp;\
  echo ${USERNAME};\
  false;\
  echo DONE
RUN set -exu;\
  which ocaml;ocaml -version;\
  which opam;opam --version;\
  opam init --disable-sandboxing -a;\
  opam switch create 4.12.1;\
  eval `opam config env`;\
  which ocaml;ocaml -version;\
  opam install -y dune;\
  echo DONE
USER root
