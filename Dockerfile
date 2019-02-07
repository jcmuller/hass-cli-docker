FROM python:3
MAINTAINER Juan C. Müller <jcmuller@gmail.com>

RUN pip install homeassistant-cli
CMD hass-cli
