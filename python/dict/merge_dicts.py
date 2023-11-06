#!/usr/bin/env python3

import json

a = {
  "apps": {
    "app1": {
      "template": "app_template",
    },
    "app2": {
      "name": "app2",
      "volume": "data"
    }
  },
  "volumes": [
    "data"
  ]
}

b = {
  "apps": {
    "app1": {
      "name": "app1",
      "volume": "db"
    }
  },
  "volumes": [
    "db"
  ]
}

c = a.copy()

print(json.dumps(c))

c.update(b)

print(json.dumps(c))
