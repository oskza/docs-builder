ARG IMG_VERSION=latest

FROM pandoc/latex:${IMG_VERSION}

RUN apk add --no-cache ttf-dejavu fontconfig && \
    tlmgr update --self && tlmgr install babel-greek && \
    mkdir -p /var/cache/fontconfig /.cache/fontconfig /.fontconfig && \
    chmod -R 777 /var/cache/fontconfig /.cache/fontconfig /.fontconfig

WORKDIR /data
