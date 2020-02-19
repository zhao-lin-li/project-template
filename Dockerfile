FROM debian:latest

ARG APP_DIR

RUN apt-get update && apt-get install -qq -y \
    shellcheck \
  && rm -rf /var/lib/apt/lists/*

WORKDIR ${APP_DIR}/

COPY . ${APP_DIR}
