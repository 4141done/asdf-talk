#!/bin/bash

# PURPOSE
# This tool outputs the output of the closest parent `.tool-versions` file
# as docker build args.
#
# For example, given a `.tool-versions` file that looks like this:
# 
# erlang 25.1
# elixir 1.14.3-otp-25
#
# The script will produce:
# "--build-arg ERLANG_VERSION=25.1 --build-arg ELIXIR_VERSION=1.14.3-otp-25"

# USAGE
# docker build $$(./versions.sh) -t myimage .

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

