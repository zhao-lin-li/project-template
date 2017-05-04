FROM debian:latest

RUN apt-get update && apt-get install -qq -y \
  shellcheck

WORKDIR /usr/src/app/

COPY . /usr/src/app/
