#!/usr/bin/env bash
set -uo pipefail
IFS=$'\n\t'

#
# Improvements from dahjelle/pre-commit.sh:
# - does not lint deleted files,
# - lints all staged files before exiting with an error code,
# - handles spaces and other unusual chars in file names.
#
# Based also on @jancimajek's one liner in that Gist.
#

# ESLint staged changes only
git diff --diff-filter=d --cached --name-only -z -- '*.js' '*.jsx' \
  | xargs -0 -I % sh -c 'git show ":%" | npx eslint --stdin --stdin-filename "%";'
linter_exit=$?

if [ ${linter_exit} -eq 0 ]; then
  echo "✓ ESLint passed"
else
  echo "✘ ESLint failed!" 1>&2
  exit ${linter_exit}
fi
