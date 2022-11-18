#!/bin/bash

function install_node_dependencies {
  local directories
  directories=("$(ls -d */)")

  printf "* You can press ctrl+c to skip current installation\n"
  printf "⌛This could take a while...\n\n"

  for directory in $directories; do
    case $directory in
      scripts/|shared/) continue ;;
      *) printf ">> Installing Node dependencies in './%s'\n" "$directory" ;;
    esac

    cd "$directory" || exit 1
      /bin/bash -c "npm install --silent"
    cd .. || exit 1

    printf "☑ Done\n\n"
  done
}

install_node_dependencies
