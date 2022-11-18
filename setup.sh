#!/bin/bash

optstring=":dghn"

# Check if the user has passed any arguments
while getopts "$optstring" arg
do 
  case "$arg" in
    d) add_docker_files=1;;
    g) add_git_repositories=1;;
    n) add_npm_packages=1;;
    h) sh ./scripts/usage.sh;;
    *) 
      echo "Invalid option: -${OPTARG}" >&2
      echo
      sh ./scripts/usage.sh
      ;;
  esac 
done

# If no flags are specified, then show usage script
if [[ ${#} -eq 0 ]]; then
  echo "No arguments specified"
  echo
  sh ./scripts/usage.sh
fi

if [[ -n $add_git_repositories ]]; then
  echo ">> Adding Git repositories"
  sh ./scripts/get_repositories.sh
fi

if [[ -n $add_docker_files ]]; then
  echo ">> Adding Docker files"
  sh ./scripts/copy_docker_files.sh
fi

if [[ -n $add_npm_packages ]]; then
  echo ">> Adding NPM packages"
  sh ./scripts/install_node_dependencies.sh
fi

