#!/usr/bin/env sh
set -eu

repository_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
test_root=$(mktemp -d)
trap 'rm -rf "$test_root"' EXIT

sh "$repository_root/scripts/bootstrap.sh" "$test_root"

for expected_file in AGENTS.md PROJECTS.md ARCHITECTURE.md; do
  test -f "$test_root/$expected_file"
done

if sh "$repository_root/scripts/bootstrap.sh" "$test_root"; then
  echo "Bootstrap must refuse a non-empty target unless --force is given" >&2
  exit 1
fi
