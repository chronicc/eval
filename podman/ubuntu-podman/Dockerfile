# This image is adopted from the following sources:
# - https://github.com/bazelbuild/continuous-integration/blob/393af9a8d2ca37dd6b4ad88f04ad34202ebf4ad5/bazel/oci/Dockerfile
# - https://github.com/containers/podman/blob/f6e41e77c75826b141291940e7678e63c0ec2351/contrib/podmanimage/stable/Containerfile

FROM ubuntu:22.04 AS base_image
ARG USER=ubuntu

RUN echo "===== Creating user: ${USER} =====" \
    && useradd \
      --system \
      --create-home \
      --home-dir=/home/${USER} \
      --shell=/bin/bash \
      --uid=1000 \
      ${USER}

RUN echo "===== Installing Packages =====" \
    && set -o errexit -o nounset \
    && export DEBIAN_FRONTEND="noninteractive" \
    && export TZ="Etc/UTC" \
    && apt-get update \
    && apt-get install --yes \
      build-essential \
      curl \
      git \
      openjdk-8-jdk \
      python3 \
      python3-pip \
      unzip \
      zip \
    && ln -s "$(which python3)" /usr/bin/python \
    && rm -rf /var/lib/apt/lists/*

FROM base_image as podman_image
ARG USER=ubuntu

RUN echo "===== Installing Podman =====" \
    && set -o errexit -o nounset \
    && export DEBIAN_FRONTEND="noninteractive" \
    && export TZ="Etc/UTC" \
    && apt-get update \
    && apt-get install --yes podman libcap2-bin \
    && rm -rf /var/lib/apt/lists/*

RUN setcap \
  cap_setuid+ep /usr/bin/newuidmap \
  cap_setgid+ep /usr/bin/newgidmap

RUN usermod \
    --add-subuids 1-999 \
    --add-subuids 1001-64535 \
    --add-subgids 1-999 \
    --add-subgids 1001-64535 \
    $USER

COPY containers.conf /etc/containers/containers.conf
COPY storage.conf /etc/containers/storage.conf
COPY podman-containers.conf /home/${USER}/.config/containers/containers.conf

RUN mkdir -p /home/${USER}/.local/share/containers \
    && chown ${USER}: -R /home/${USER} \
    && chmod 644 /etc/containers/containers.conf

VOLUME /var/lib/containers
VOLUME /home/${USER}/.local/share/containers

RUN mkdir -p /var/lib/shared/overlay-images \
             /var/lib/shared/overlay-layers \
             /var/lib/shared/vfs-images \
             /var/lib/shared/vfs-layers \
    && touch /var/lib/shared/overlay-images/images.lock \
    && touch /var/lib/shared/overlay-layers/layers.lock \
    && touch /var/lib/shared/vfs-images/images.lock \
    && touch /var/lib/shared/vfs-layers/layers.lock

ENV _CONTAINERS_USERNS_CONFIGURED=""

# FROM base_image AS downloader
# ARG USER=ubuntu
# ARG BAZEL_VERSION
#
# WORKDIR /var/bazel
# RUN echo "===== Installing Bazel =====" \
#     && set -o errexit -o nounset \
#     && curl \
#         --fail \
#         --location \
#         --remote-name \
#         "https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-linux-x86_64" \
#     && curl \
#         --fail \
#         --location \
#         "https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-linux-x86_64.sha256" \
#     | sha256sum --check \
#     && mv "bazel-${BAZEL_VERSION}-linux-x86_64" bazel \
#     && chmod +x bazel

# FROM podman_image
# ARG USER=ubuntu
#
# USER ${USER}
# WORKDIR /home/${USER}
# COPY --from=downloader /var/bazel/bazel /usr/local/bin/bazel
# ENTRYPOINT ["/usr/local/bin/bazel"]
