FROM fluent/fluentd:v1.3.3-1.0
USER root
ENTRYPOINT []

RUN apk add --no-cache --virtual .build-deps build-base ruby-dev \
    && gem install fluent-plugin-google-cloud \
    && apk del .build-deps

ENV GOOGLE_APPLICATION_CREDENTIALS=/gcp-credentials.json

CMD ["fluentd", "-p", "/fluentd/plugins", "-c", "/fluentd.conf"]
