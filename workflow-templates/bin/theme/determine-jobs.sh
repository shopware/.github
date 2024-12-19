#!/usr/bin/env bash
set -euo pipefail

if [ -n "${DEBUG:-}" ]; then
  set -x
fi

export STOREFRONT_PATH="${STOREFRONT_PATH}"

should_run() {
  local job; job="${1}"

  if [ "${job}" = "build" ]; then
    return 0
  fi

  if [ "${job}" = "test_jest" ]; then
    if [ -f "${STOREFRONT_PATH}/package-lock.json" ] && [ -f "${STOREFRONT_PATH}/jest.config.js" ]; then
      return 0
    fi

    return 1
  fi

  if [ "${job}" = "test_playwright" ]; then
    if find tests/ -name "playwright.config.*" | read; then
      return 0
    fi

    return 1
  fi

  return 1
}

main() {
  for job in "${@}"; do
    if should_run "${job}"; then
        echo "${job}=true" >> "${GITHUB_OUTPUT}"
      else
        echo "${job}=false" >> "${GITHUB_OUTPUT}"
      fi
  done
}

main "${@}"