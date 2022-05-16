FROM debian:bullseye-slim

ARG VERSION=5.4.3

WORKDIR /var/gnuplot/

RUN apt update &&\
    apt install -y --no-install-recommends \
    wget \
    gcc \
    g++ \
    automake \
    checkinstall \
    libpango1.0-dev \
    libreadline-dev \
    libx11-dev \
    libxt-dev \
    texinfo \
    libgdchart-gd2-xpm-dev \
    libcerf-dev &&\
    wget --no-check-certificate https://sourceforge.net/projects/gnuplot/files/gnuplot/${VERSION}/gnuplot-${VERSION}.tar.gz &&\
    tar zxvf gnuplot-${VERSION}.tar.gz &&\
    cd ./gnuplot-${VERSION} &&\
    ./configure &&\
    (make || true) &&\
    (make install || true) &&\
    cd .. &&\
    rm -r gnuplot-${VERSION} &&\
    rm gnuplot-${VERSION}.tar.gz &&\
    apt remove -y --purge wget gcc g++ automake checkinstall &&\
    apt autoremove -y

ENTRYPOINT [ "gnuplot" ]