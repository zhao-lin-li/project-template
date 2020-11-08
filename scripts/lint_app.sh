#!/bin/sh

# This script lints the application

shellcheck -- *.sh
for file in scripts/**/*.sh; do
  shellcheck "$file"
done

