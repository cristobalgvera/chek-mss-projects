#!/bin/bash

function copy_docker_files {
  local directories
  directories=("$(ls -d */)")

  local files=(
    Dockerfile
    .dockerignore
  )

  for directory in $directories; do
    if [[ "$directory" = scripts/ ]]; then
      continue
    fi

    printf "Copying files to './%s'\n" "$directory"

    for file in "${files[@]}"; do
      cp "$file" ./"$directory"
    done
  done
}

copy_docker_files
