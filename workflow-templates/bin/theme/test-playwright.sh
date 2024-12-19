#!/usr/bin/env bash
set -euo pipefail

if [ -n "${DEBUG:-}" ]; then
  set -x
fi

export APP_PATH="${APP_PATH}"
export TESTS_PATH="${TESTS_PATH}"

function set_env() {
  if [ -z "${GITHUB_ACTIONS:-}" ]; then
    export "${@?}"
  else
    echo "${@}" >> "${GITHUB_ENV:-}"
  fi
}

function setup_integration() {
  local auth; auth="$(bin/console integration:create --admin Playwright)"

  if [ -z "${auth}" ]; then
    echo "Failed to create integration"
    return 1
  fi

  set_env "${auth}"
}

function playwright() {
  cd "${APP_PATH}"

  if [ ! -d "${TESTS_PATH}" ]; then
    echo "couldn't find tests path; Make sure TESTS_PATH is set"
    return 1
  fi

  cd "${TESTS_PATH}"

  npm ci --no-audit --prefer-offline
  npx playwright install --with-deps

  npx playwright test
}

"${@}"