FROM python:3
MAINTAINER Juan C. Muller <jcmuller@gmail.com>

RUN git clone https://github.com/home-assistant/home-assistant-cli.git /app
ADD . /app
WORKDIR /app
RUN \
  python3 -m venv . && \
  . bin/activate && \
  script/setup

CMD ['bin/hass-cli']
