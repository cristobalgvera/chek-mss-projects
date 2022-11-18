#!/bin/bash

function install_node_dependencies {
  local directories
  directories=("$(ls -d */)")

  printf "* You can press ctrl+c to skip current installation\n"
  printf "⌛This could take a while...\n\n"

  for directory in $directories; do
    if [[ "$directory" = scripts/ ]]; then
      continue
    fi

    printf ">> Installing Node dependencies in './%s'\n" "$directory"

    cd "$directory" || exit 1

    /bin/bash -c "npm install --silent"

    printf "☑ Done\n\n"
    cd .. || exit 1
  done
}

install_node_dependencies
