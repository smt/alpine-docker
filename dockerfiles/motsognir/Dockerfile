FROM alpine:3.8
MAINTAINER Stephen M. Tudor <smt@smt.io>

ENV MOTSOGNIR_VERSION=1.0.9

COPY motsognir-$MOTSOGNIR_VERSION /tmp/motsognir-$MOTSOGNIR_VERSION

RUN addgroup -g 1000 gopher \
    && adduser -u 1000 -G gopher -s /bin/sh -D gopher \
    && apk add --no-cache \
        musl-dev \
    && apk add --no-cache --virtual .build-deps \
        gcc \
        libgcc \
        linux-headers \
        make \
    && cd /tmp/motsognir-$MOTSOGNIR_VERSION \
    && make \
    && make install \
    && cd .. \
    && rm -rf /tmp/motsognir-$MOTSOGNIR_VERSION \
    && apk del .build-deps \
    && mkdir -p /var/gopher

COPY start_motsognir.sh /srv/start_motsognir.sh

VOLUME ["/var/gopher"]
VOLUME ["/srv/motsognir.conf"]

WORKDIR /var/gopher

CMD ["/srv/start_motsognir.sh"]
