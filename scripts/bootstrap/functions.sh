#!/bin/sh

# some functions are defined with parenthesis instead of curly braces
# to support shellcheck linting and local variables
# https://github.com/thoughtbot/laptop/issues/481
# https://stackoverflow.com/questions/18597697/posix-compliant-way-to-scope-variables-to-a-function-in-a-shell-script#answer-18600920

# set_defaults
#
# sets up the defaults to be used later
#
# example usage: set_defaults
set_defaults() {
  environment=development
}

# gather_options
#
# gathers the options provided by the user
# based off of http://linuxcommand.org/lc3_wss0120.php
#
# example usage: gather_options "$@"
gather_options() {
  while [ "$1" != "" ]; do
    case $1 in
      -e)
        environment=$2
        shift
      ;;
    esac
    shift
  done
}

# teardown_containers
#
# clear out containers of any remnants of the application
#
# example usage: teardown_containers
teardown_containers() (
  environment=$1

  case $environment in
    'development')
      docker compose down --volumes
    ;;
  esac
)

# setup_containers
#
# set up containers to run application
#
# example usage: setup_containers
setup_containers() (
  environment=$1

  case $environment in
    'development')
      docker compose build --pull
    ;;
  esac
)

