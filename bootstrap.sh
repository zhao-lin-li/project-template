#!/bin/sh

# This script bootstraps the application

set -e

### define functions
SRC_DIR=$(cd "$(dirname "$0")"; pwd -P)
. "$SRC_DIR"/scripts/bootstrap/functions.sh

set_defaults() {
  ENV=development
}

gather_options() {
  while getopts "e:" OPT; do
    case $OPT in
      e)
        ENV=$OPTARG
      ;;
    esac
  done
}

### define functions:end

set_defaults
gather_options "$@"

case $ENV in
  'development')
    echo "Clearing out old containers"
    teardown_containers "$ENV"
    echo "Setting up $ENV containers"
    setup_containers "$ENV"
  ;;
esac
