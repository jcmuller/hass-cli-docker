FROM python:3
MAINTAINER Juan C. Müller <jcmuller@gmail.com>

RUN pip install homeassistant-cli

ENTRYPOINT ["/usr/local/bin/python3", "/usr/local/bin/hass-cli"]
CMD ["--help"]
