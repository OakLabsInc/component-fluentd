FROM fluent/fluentd:stable
USER root
ENTRYPOINT []

RUN apk add --no-cache --virtual .build-deps build-base ruby-dev \
    && gem install fluent-plugin-loggly \
    && apk del .build-deps
COPY ./fluentd.conf /fluentd.conf


CMD ["fluentd", "-p", "/fluentd/plugins", "-c", "/fluentd.conf"]
