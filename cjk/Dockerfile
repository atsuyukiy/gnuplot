FROM alpine:latest

LABEL maintainer="Atsuyuki Yamada <atsuyuki.phys@gmail.com>"

WORKDIR /var/gnuplot

RUN apk add --update --no-cache gnuplot font-noto-cjk

ENTRYPOINT [ "gnuplot" ]