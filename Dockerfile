FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      ca-certificates \
      curl \
      git \
      nano \
 && rm -rf /var/lib/apt/lists/*

ENV EDITOR=nano

RUN useradd -m -s /bin/bash appuser \
 && echo "appuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER appuser
WORKDIR /home/appuser

CMD ["bash"]
