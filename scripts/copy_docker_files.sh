#!/bin/bash

function copy_docker_files {
  local directories
  directories=("$(ls -d */)")

  local files=(
    Dockerfile
    .dockerignore
  )

  for directory in $directories; do
    case $directory in
      scripts/|shared/) continue ;;
      *) printf "Copying files to './%s'\n" "$directory" ;;
    esac

    for file in "${files[@]}"; do
      cp ./shared/"$file" ./"$directory"
    done
  done
}

copy_docker_files
