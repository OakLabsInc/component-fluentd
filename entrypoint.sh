#!/bin/sh

exec fluentd -p /fluentd/plugins -c $FLUENTD_CONFIG $FLUENTD_OPT