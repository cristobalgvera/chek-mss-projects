#!/bin/bash

function get_repositories {
  local repositories=(
    br-ms-sd00270-oi00016-otphandler
    br-ms-sd00270-oi00017-createotp
    br-ms-sd00270-oi00018-validateotp
    br-ms-sd00270-oi00019-smsprovider
    br-ms-sd00270-oi00020-updateotp
  )

  for repository in "${repositories[@]}"; do
    printf "Cloning repository '%s'\n\n" "$repository"
    /bin/bash -c "git clone git@bitbucket.org:banco_ripley/$repository.git"
  done
}

get_repositories
