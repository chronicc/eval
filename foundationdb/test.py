#!/usr/bin/env python3

import fdb

fdb.api_version(630)

db = fdb.open()
db[b'hello'] = b'world'

print('hello', db[b'hello'])

