#!/bin/sh

set -e

chef exec foodcritic -f any .
echo

chef exec rubocop
echo

chef exec rspec --color --format progress
echo

chef exec kitchen test
