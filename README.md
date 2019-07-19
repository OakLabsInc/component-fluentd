# OakOS Component - FluentD Logger for Loggly

This component uses
[fluentd](https://docs.fluentd.org/v1.0/articles/quickstart) to send
logs to Loggly. All of the containers in your OakOS services array will have their logs forwarded.

After creating an account on [https://www.loggly.com/](https://www.loggly.com) you can go to
[https://zivelo.loggly.com/account/users/api/tokens](https://zivelo.loggly.com/account/users/api/tokens) to get your personal token. This token will need to be passed as an environmental variable at install time like: `"LOGGLY_TOKEN": "xxxxxxxxxxxxxxxxxxxxxxxx"`

This container can be adapted to send logs from many different devices by
sending a unique environmental variable for `"LOGGLY_TAG": "mycustomtag"` during install. This type can then be added as a filter in the Loggly [Search](https://zivelo.loggly.com/search) screen. Just add a filter in the input box like `tag:mycustomtag`
It  comes with the `fluent-plugin-loggly` plugin
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
      "image": "index.docker.io/oaklabs/component-fluentd:loggly",
      "environment": {
        "LOGGLY_TAG": "my-custom-tag",
        "LOGGLY_TOKEN": "xxxxxxxxxxxxxxxxxx"
      }
    }
  ]
}
```

