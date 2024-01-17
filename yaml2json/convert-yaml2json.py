#!/usr/bin/env python3

import yaml
import json
import re

def iterate(e):
    if isinstance(e, dict):
        for k, v in e.items():
            e[k] = iterate(v)
    elif isinstance(e, list):
        for k, v in e.iteritems():
            e[k] = iterate(v)
    if isinstance(e, str) and e.startswith('{') and e.endswith('}'):
        e2 = ''
        for line in e.splitlines():
            e2 += re.sub(r'^\s*', '', line)
        e = e2
        e = e.replace(': ', ':')
    return e

with open('spec.yml', 'r') as yaml_file:
    configuration = yaml.safe_load(yaml_file)

with open('spec.json', 'w') as json_file:
    configuration = json.dumps(iterate(configuration), indent=2)
    print(configuration)
    json_file.write(configuration)
