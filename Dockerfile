FROM alpine:3.19

RUN apk update && apk add alpine-sdk


RUN adduser -D build && addgroup build abuild 

RUN sed -i '1s;^;/home/build/packages/community\n;' /etc/apk/repositories
RUN sed -i '1s;^;/home/build/packages/testing\n;' /etc/apk/repositories


RUN mkdir -p /var/cache/distfiles && chgrp abuild /var/cache/distfiles \
   && chmod g+w /var/cache/distfiles

USER build

RUN git config --global user.name "Ingress NGINX build system" \
    && git config --global user.email "ingress@kubernetes.io"

RUN git clone https://gitlab.alpinelinux.org/alpine/aports

RUN cd aports/community/grpc && abuild -r

USER root

RUN apk update && apk add grpc-dev


