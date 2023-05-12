#!/bin/bash

# PURPOSE
# This tool outputs the 
target_file=".tool-versions"

current_dir=$(pwd)

while [[ "$current_dir" != "/" ]]; do
  if [[ -f "$current_dir/$target_file" ]]; then
    build_args=""
    while IFS=' ' read -r tool version
    do
      build_args+="--build-arg $(echo "$tool" | tr '[:lower:]' '[:upper:]')_VERSION=${version} "
    done < "$current_dir/$target_file"

    echo $build_args
    exit 0
  fi

  # Move up a directory
  current_dir=$(dirname "$current_dir")
done

echo "Could not find a $target_file file in this or any parent directory"
exit 1

