#!/bin/bash

function copy_docker_files {
  local directories
  directories=("$(ls -d */)")

  for directory in $directories; do
    case $directory in
      scripts/|shared/) continue ;;
      *) printf "Copying files and folders to './%s'\n" "$directory" ;;
    esac

    cp -r ./shared/ ./"$directory"
  done
}

copy_docker_files
