#!/usr/bin/env sh
set -eu

force=false
if [ "${1:-}" = "--force" ]; then
  force=true
  shift
fi

if [ "$#" -ne 1 ]; then
  echo "Usage: ./scripts/bootstrap.sh [--force] /path/to/control-center" >&2
  exit 2
fi

target_dir=$1
script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
template_dir="$script_dir/../templates/control-center"

if [ ! -d "$template_dir" ]; then
  echo "Control-center template not found: $template_dir" >&2
  exit 1
fi

if [ -e "$target_dir" ] && [ -n "$(find "$target_dir" -mindepth 1 -maxdepth 1 -print -quit)" ] && [ "$force" != true ]; then
  echo "Target already contains files. Choose an empty folder or rerun with --force: $target_dir" >&2
  exit 1
fi

mkdir -p "$target_dir"
cp -R "$template_dir/." "$target_dir/"
printf '%s\n' "Control center created at: $target_dir"
