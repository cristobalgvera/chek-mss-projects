#!/bin/bash

copy_docker_files() {
  local directories
  directories=("$(ls -d */)")

  local files=(
    Dockerfile
    .dockerignore
  )

  for directory in $directories; do
    printf "Copying files to './%s'\n" "$directory"

    for file in "${files[@]}"; do
      cp "$file" ./"$directory$file"
    done
  done
}

copy_docker_files
