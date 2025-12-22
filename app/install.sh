#!/usr/bin/env bash

set -o nounset # error when referencing undefined variable
set -o errexit # exit when command fails

# goes to the script directory
cd "$(dirname "$0")"

BOLD="$(tput bold 2>/dev/null || echo '')"
GREY="$(tput setaf 0 2>/dev/null || echo '')"
BLUE="$(tput setaf 4 2>/dev/null || echo '')"
RED="$(tput setaf 1 2>/dev/null || echo '')"
NO_COLOR="$(tput sgr0 2>/dev/null || echo '')"
YELLOW="$(tput setaf 3 2>/dev/null || echo '')"

error() {
  printf "${RED} $@${NO_COLOR}\n" >&2
}

warn() {
  printf "${YELLOW}! $@${NO_COLOR}\n"
}

info() {
  printf "${BLUE} $@${NO_COLOR}\n"
}

build() {
  if command -v yarn &>/dev/null; then
    yarn upgrade
    yarn build
  else
    echo "No yarn found"
    exit 1
}

build

