#!/bin/sh

# This script bootstraps the application

# shellcheck disable=2031 # $environment variable is defined in a function that
                          # is abstracted away

set -e
SRC_DIR=$(cd "$(dirname "$0")" || exit; pwd -P)

# shellcheck source=scripts/bootstrap.functions.sh
. "$SRC_DIR"/scripts/bootstrap.functions.sh

set_defaults
gather_options "$@"

case $environment in
  'development')
    echo "Clearing out old containers"
    teardown_containers "$environment"
    echo "Setting up $environment containers"
    setup_containers "$environment"
  ;;
  'production')
    echo "Do production stuff" # placeholder
  ;;
esac

