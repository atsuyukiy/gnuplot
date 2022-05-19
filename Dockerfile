FROM alpine:latest

LABEL maintainer="Atsuyuki Yamada <atsuyuki.phys@gmail.com>"

ARG VERSION=5.4.3

WORKDIR /var/gnuplot/

RUN apk add --update --no-cache gcc g++ build-base libx11-dev gd-dev cairo-dev pango-dev glib-dev ttf-freefont &&\
    wget --no-check-certificate https://downloads.sourceforge.net/sourceforge/gnuplot/gnuplot-${VERSION}.tar.gz &&\
    tar zxvf gnuplot-${VERSION}.tar.gz &&\
    cd ./gnuplot-${VERSION} &&\
    ./configure &&\
    (make || true) &&\
    (make install || true) &&\
    cd .. &&\
    rm -r gnuplot-${VERSION} &&\
    rm gnuplot-${VERSION}.tar.gz &&\
    apk del gcc g++ build-base

ENTRYPOINT [ "gnuplot" ]