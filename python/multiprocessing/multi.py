#!/usr/bin/env python3

import multiprocessing
import time
from datetime import datetime


START_TIME = datetime.now()


def mapfn(x):
    time.sleep(x)
    duration = datetime.now() - START_TIME
    return '%s finished after %s seconds' % (x, duration)

def main():
    print('Starting single process example...')
    pool = multiprocessing.Pool()
    result = pool.map(mapfn, range(5))
    print(list(result))

if __name__ == '__main__':
    main()

