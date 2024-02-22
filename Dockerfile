FROM alpine:3.19 as builder

ARG package_path
ARG package_install

COPY hack /hack
COPY keys /keys 

RUN /hack/prepare-user.sh

USER build
WORKDIR /home/build

RUN /hack/prepare-build-env.sh

RUN cd aports/${package_path} && abuild -r

USER root

RUN apk update && apk add ${package_install}

FROM scratch
COPY --from=builder /home/build/packages /packages 
