FROM python:3
MAINTAINER Juan C. Müller <jcmuller@gmail.com>

RUN pip install homeassistant-cli

RUN apt-get update; \
  DEBIAN_FRONTEND=noninteractive apt-get install -y \
    vim-nox \
    && \
  rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/local/bin/python3", "/usr/local/bin/hass-cli"]
CMD ["--help"]
