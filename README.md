# OakOS Component - FluentD Logger for Logz.io

This component uses
[fluentd](https://docs.fluentd.org/v1.0/articles/quickstart) to send
logs to logz.io. All of the containers in your OakOS services array will have their logs forwarded.

After creating an account on [https://logz.io/](https://logz.io/) you can go to
[https://app.logz.io/#/dashboard/settings/general](https://app.logz.io/#/dashboard/settings/general) to get your personal token. This token will need to be passed as an environmental variable at install time like: `"LOGZ_TOKEN": "xxxxxxxxxxxxxxxxxxxxxxxx"`

This container can be adapted to send logs from many different devices by
sending a unique environmental variable for `"LOGZ_TYPE": "my-custom-type"` during install. This type can then be added as a filter in the logz [Kibana](https://app.logz.io/#/dashboard/kibana) > Discover screen. just add a filter in the upper left to just see the results from your installed service group.

It  comes with the `fluent-plugin-logzio` plugin
installed.

## Install example snippet

This example uses our [app-lights](https://hub.docker.com/r/oaklabs/app-lights) and [component-oak-lights](https://hub.docker.com/r/oaklabs/component-oak-lights) for demonstration purposes. These are all public containers and no usernames and passwords are needed.

``` json
{
  "services": [
    {
      "image": "index.docker.io/oaklabs/app-lights:2.1.0",
      "environment": {
        "LIGHTS_HOST": "localhost:9100",
        "PLATFORM_HOST": "localhost:443",
        "NODE_ENV": "production"
      }
    },
    {
      "image": "index.docker.io/oaklabs/component-oak-lights:0.0.3",
      "environment": {
        "PORT": "9100"
      }
    },
    {
      "image": "index.docker.io/oaklabs/component-fluentd:logzio",
      "environment": {
        "LOGZ_TYPE": "my-custom-type",
        "LOGZ_TOKEN": "xxxxxxxxxxxxxxxxxx"
      }
    }
  ]
}
```

