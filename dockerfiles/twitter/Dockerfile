FROM ruby:alpine
MAINTAINER Stephen M. Tudor <smt@smt.io>

# twitter() {
#     docker run -it --rm \
#         -v ~/.trc:/root/.trc \
#         smtudor/twitter $@
# }

RUN apk add --no-cache \
    ca-certificates

RUN set -x \
    && apk add --no-cache --virtual .build-deps \
    build-base \
    && gem install io-console t --no-rdoc --no-ri \
    && apk del .build-deps

VOLUME /root/.trc

ENTRYPOINT ["t"]
