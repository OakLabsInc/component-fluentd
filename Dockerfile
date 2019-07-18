FROM fluent/fluentd:stable
USER root
ENTRYPOINT []

RUN apk add --no-cache --virtual .build-deps build-base ruby-dev \
    && gem install fluent-plugin-google-cloud \
    && apk del .build-deps

ENV GOOGLE_APPLICATION_CREDENTIALS=/gcp-credentials.json

CMD ["fluentd", "-p", "/fluentd/plugins", "-c", "/fluentd.conf"]
