#!/usr/bin/env python3


import click
import json
import sys


@click.command()
@click.argument('input')
def run(input):
    """Tries to convert a json file into an elastic document and returns an error if this fails."""

    with open(input, 'r') as fp:
        content = json.load(fp)
    for key in content:
        keys = key.split('.', 1)
        if len(keys) > 1:
            if keys[0] in content:
                target = content[keys[0]]
                if isinstance(target, dict):
                    target[keys[1]] = content[key]
                else:
                    sys.exit('ERROR: \'%s\' is used multiple times and is not of type \'object\'.' % keys[0])
    print(content)


if __name__ == '__main__':
    run()

