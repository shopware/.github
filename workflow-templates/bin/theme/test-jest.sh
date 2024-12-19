#!/usr/bin/env bash
set -euo pipefail

if [ -n "${DEBUG:-}" ]; then
  set -x
fi

export STOREFRONT_PATH="${STOREFRONT_PATH}"

cd "${STOREFRONT_PATH}"

install () {
  npm ci --no-audit --prefer-offline
}

test () {
  # shellcheck disable=SC2046
  $(npm bin)/jest --config jest.config.js --ci
}

main () {
  install
  test
}

main