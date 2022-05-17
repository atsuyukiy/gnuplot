FROM alpine:latest

WORKDIR /var/gnuplot

RUN apk add --update --no-cache gnuplot font-noto-cjk

ENTRYPOINT [ "gnuplot" ]