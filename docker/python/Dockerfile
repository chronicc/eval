FROM ubuntu:18.04

ENV PYPI_USERNAME=python-robot
ENV PYPI_PASSWORD=python-robot

RUN apt update \
 && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
        python3-minimal \
        python3-pip \
 && apt clean \
 && rm -rf /var/lib/apt/lists/*
ADD pip.conf /root/.config/pip/

ENTRYPOINT ["/bin/bash"]

