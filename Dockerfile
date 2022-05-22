FROM alpine:latest

LABEL maintainer="Atsuyuki Yamada <atsuyuki.phys@gmail.com>"

ARG VERSION=5.4.3

WORKDIR /var/gnuplot

RUN apk add --update --no-cache gcc g++ build-base gd-dev pango-dev ttf-freefont &&\
    wget --no-check-certificate https://downloads.sourceforge.net/sourceforge/gnuplot/gnuplot-${VERSION}.tar.gz &&\
    tar -zxvf gnuplot-${VERSION}.tar.gz &&\
    cd gnuplot-${VERSION} &&\
    ./configure &&\
    make ;\
    make install &&\
    cd .. &&\
    rm -rf gnuplot-${VERSION} /usr/lib/python3.9 /usr/lib/perl5 /usr/share/perl5 /usr/share/xml/docbook &&\
    rm gnuplot-${VERSION}.tar.gz &&\
    apk del --purge gcc g++ build-base

ENTRYPOINT [ "gnuplot" ]