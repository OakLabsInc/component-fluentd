FROM fluent/fluentd:v1.4

USER root

RUN apk add --no-cache --virtual .build-deps build-base ruby-dev \
    && gem install fluent-plugin-google-cloud \
    && apk del .build-deps

COPY config /config
COPY secrets /secrets
COPY entrypoint.sh /

RUN chmod -R 0400 /secrets \
    && chown -R root:root /secrets \
    && chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

ENV FLUENTD_CONFIG="/fluentd/etc/fluentd.conf" \
    GOOGLE_APPLICATION_CREDENTIALS="/secrets/default-credentials.json" \
    GOOGLE_ZONE="us-central1-a"
