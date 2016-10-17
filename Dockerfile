FROM alpine

MAINTAINER Daniel STANCU <birkof@birkof.ro>

RUN apk add --no-cache ruby ruby-bigdecimal sqlite-libs libstdc++ ca-certificates

ENV MAILCATCHER_VERSION 0.6.4

RUN \
    buildDeps=" \
        ruby-dev \
        make g++ \
        sqlite-dev \
    " && \
    apk add --no-cache $buildDeps && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/* && \
    gem install -v $MAILCATCHER_VERSION mailcatcher --no-ri --no-rdoc && \
    apk del $buildDeps

EXPOSE 25 80

CMD ["mailcatcher", "--foreground", "--ip=0.0.0.0", "--smtp-port=25", "--http-port=80"]
