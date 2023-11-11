FROM ubuntu:23.10

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
	git make gcc g++ rustc cargo cmake meson pkg-config \
	curl flex bison clang python3 \
	lsb-release binutils nasm llvm-14 \
	libfmt-dev zlib1g-dev libblocksruntime-dev libgmp-dev libreadline-dev \
	libnuma-dev libssl-dev gfortran ruby \
	fortune cowsay xxd \
	libsqlite3-dev libcurl4-openssl-dev libhiredis-dev \
	gettext luajit ocaml opam swi-prolog

# The games path is used by fortune and cowsay:
ENV PATH "${PATH}:/usr/games"

RUN ln -s /usr/bin/llc-14 /usr/bin/llc

# Install Node.js 20
RUN apt-get install -y npm && npm install -g n && n 20

RUN mkdir /home/runner && groupadd runner && useradd --home /home/runner -g runner runner
RUN chown runner:runner /home/runner

WORKDIR /app
RUN mkdir -p /app/staging # In case we're in a context where mounts don't work
RUN chown runner:runner /app && chown -R runner:runner /app/staging
USER runner

COPY langs langs
COPY scripts scripts

RUN ./scripts/compile-all.sh
RUN rm -rf work
