# OakOS Component - FluentD Logger

This component uses
[fluentd](https://docs.fluentd.org/v1.0/articles/quickstart) to send
logs to GCP Stackdriver. It can be adapted to send logs to other
services and to receive logs from application by a variety of
methods. It also comes with the `fluent-plugin-google-cloud` plugin
installed.

The container expects a Fluentd configuration to be mounted at
`/fluentd.conf`. If using the Google Cloud plugin to send logs to
Stackdriver, a service account credentials file should be mounted at
`/gcp-credentials.json` (according to the
`GOOGLE_APPLICATION_CREDENTIALS` env var).

See the
[Google Cloud Plugin docs](https://github.com/GoogleCloudPlatform/fluent-plugin-google-cloud)
for instructions on getting GCP service account credentials.
