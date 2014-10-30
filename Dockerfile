# Google mirrors are very fast.
FROM debian:wheezy

MAINTAINER Ozzy Johnson <ozzy.johnson@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

ENV CUDA_VERSION 6.5.14
ENV CUDA_INSTALL http://developer.download.nvidia.com/compute/cuda/6_5/rel/installers/cuda_${CUDA_VERSION}_linux_64.run

# Update and install minimal.
RUN \
  apt-get update \
            --quiet && \
  apt-get install \
            --yes \
            --no-install-recommends \
            --no-install-suggests \
    boinc-client \
    build-essential \
    module-init-tools \
    wget && \

# Clean up packages.
  apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install CUDA.
RUN wget \
      $CUDA_INSTALL \
      -P /tmp && \
    chmod +x /tmp/cuda_${CUDA_VERSION}_linux_64.run && \
    /tmp/cuda_${CUDA_VERSION}_linux_64.run \
      -extract=/tmp && \
    /tmp/NVIDIA-Linux-x86_64-340.29.run \
      -s \
      -N \
      --no-kernel-module && \
    /tmp/cuda-linux64-rel-${CUDA_VERSION}-18749181.run \
      -noprompt && \
    rm /tmp/cuda_${CUDA_VERSION}_linux_64.run && \
    rm /tmp/NVIDIA-Linux-x86_64-340.29.run && \
    rm /tmp/cuda-linux64-rel-${CUDA_VERSION}-18749181.run

# Simple script to get things done.
ADD start_boinc.sh /start_boinc.sh

# Data volume.
ONBUILD VOLUME /data

# Getting ready.
WORKDIR /data

# Default command.
ENTRYPOINT ["/bin/bash", "/start_boinc.sh"]
