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
    handle_template_files "$directory"
  done
}

function handle_template_files {
  local directory=$1

  SERVICE_NAME=$(basename "$directory")
  export SERVICE_NAME

  local templates_paths=(
    .devcontainer/compose.devcontainer.yml
  )

  for template_path in "${templates_paths[@]}"; do
    create_file_from_template \
      ./"$directory"/"$template_path" \
      ./shared/"$template_path"
  done

  unset SERVICE_NAME
}

function create_file_from_template {
  local destionation_path=$1
  local template_path=$2

  eval "cat << EOF > $destionation_path
$(<$template_path)
EOF
  " 2> /dev/null
}

copy_docker_files
