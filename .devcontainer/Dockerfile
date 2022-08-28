ARG UBUNTU_VER
FROM ubuntu:${UBUNTU_VER}
RUN set -eux;\
 apt-get update; env DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
 aspcud \
 autoconf \
 automake \
 build-essential \
 bzip2 \
 ca-certificates \
 cmake \
 curl \
 git-core \
 libc6-dev \
 ocaml-nox \
 pkg-config \
 sudo \
 unzip \
 xz-utils \
 ;\
 env DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y software-properties-common;\
 add-apt-repository ppa:avsm/ppa;\
 apt install --no-install-recommends -y opam;\
 apt remove --auto-remove -y software-properties-common;\
 apt-get clean;rm -rf /var/lib/apt/lists/*;\
 echo DONE
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN \
  set -eux; \
  groupadd -g $USER_GID $USERNAME; \
  useradd -m -u $USER_UID -g $USER_GID $USERNAME; \
  usermod -aG sudo $USERNAME; \
  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers; \
  echo DONE
ARG UBUNTU_VER
#USER ${USERNAME}
RUN set -exu;\
  which ocaml;ocaml -version;\
  which opam;opam --version;\
  if [ _${UBUNTU_VER} = _16.04 ]; then \
   curl -o /tmp/install.sh -sL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh;\
   (echo;)|sh /tmp/install.sh;\
   which opam;opam --version;\
   rm /tmp/*;fi;\
  opam init --disable-sandboxing -a;\
  opam switch create 4.12.1;\
  eval `opam config env`;\
  which ocaml;ocaml -version;\
  opam install -y dune;\
  echo DONE
