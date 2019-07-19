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

## Other Shippers

Fluentd has many plugins to assist with shipping logs to various aggregators. Here are a few examples:

* Logz - example [here](https://github.com/OakLabsInc/component-fluentd/tree/logzio)
* Loggly - example [here](https://github.com/OakLabsInc/component-fluentd/tree/loggly)

Many other input/output plugins can be found at https://www.fluentd.org/plugins/all#filter
