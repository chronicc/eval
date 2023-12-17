#!/usr/bin/env bash

kubectl -n awx create secret tls  awx-cert --key ./awx.key --cert ./awx.crt

