#!/bin/sh

# This script bootstraps the application

set -e
SRC_DIR=$(cd "$(dirname "$0")" || exit; pwd -P)

# shellcheck source=scripts/bootstrap/functions.sh
. "$SRC_DIR"/scripts/bootstrap/functions.sh

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

