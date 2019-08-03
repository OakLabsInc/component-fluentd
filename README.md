# OakOS Component - FluentD Logger for Loggly

This component uses
[fluentd](https://docs.fluentd.org/v1.0/articles/quickstart) to send
logs to Loggly. All of the containers in your OakOS services array will have their logs forwarded.

After creating an account on [https://www.loggly.com/](https://www.loggly.com) you can go to
[https://zivelo.loggly.com/account/users/api/tokens](https://zivelo.loggly.com/account/users/api/tokens) to get your personal token. Remember that in our case `zivelo` in the url is there because that was the company defined when setting up our account. Your login URLs will be the same but replacing zivelo with your company name. This token will need to be passed as an environmental variable at install time like: `"LOGGLY_TOKEN": "xxxxxxxxxxxxxxxxxxxxxxxx"`

This container can be adapted to send logs from many different devices by
sending a unique environmental variable for `"LOGGLY_TAG": "mycustomtag"` during install. This type can then be added as a filter in the Loggly [Search](https://zivelo.loggly.com/search) screen. Just add a filter in the input box like `tag:mycustomtag`
It  comes with the `fluent-plugin-loggly` plugin
installed.

## Example Installation

``` json
{
  "services": [
    {
      "image": "index.docker.io/oaklabs/app-example:release-1.0.1",
      "environment": {
        "TZ": "America/Pheonix"
      }
    },
    {
      "image": "index.docker.io/oaklabs/component-fluentd:loggly",
      "environment": {
        "LOGGLY_TAG": "{{logglyTag}}",
        "LOGGLY_TOKEN": "{{logglyToken}}"
      }
    }
  ]
}
```

* `{{logglyTag}}` Postman environmental variable that is sent to allow Loggly query/filter.
* `{{logglyToken}}` Postman environmental variable that is your personal Loggly access token.
