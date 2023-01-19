#!/bin/sh

# This script installs the application dependencies

yum --nobest --assumeyes update
# yum --allowerasing --assumeyes install \ # this will error out if no packages are listed
yum clean all
