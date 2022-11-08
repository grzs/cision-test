FROM docker.io/library/archlinux:base-devel
LABEL description="The only purpose of this image is to build nginx. \
Parameters (CMD) are passed to makepkg."
ARG version=1.19.0

# install dependencies
RUN pacman-key --init && \
    pacman -Syu --noconfirm && \
    pacman -S --noconfirm base-devel pcre zlib openssl geoip mailcap libxcrypt

# enable sudo for group wheel and create admin user
RUN sed -i.bkp 's/^\(# *\)\(%wheel.*NOPASSWD.*\)/\2/' sudoers && \
    useradd -m -G wheel admin

WORKDIR /home/admin

# copy files and set version
COPY --chown=admin makefiles/ ./
RUN sed -i.bkp 's/\(pkgver=\).*/\1'${version}/ PKGBUILD

USER admin
ENTRYPOINT ["/home/admin/build-nginx.sh"]
