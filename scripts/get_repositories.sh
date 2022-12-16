#!/bin/bash

function get_repositories {
  local repositories=(
    br-ms-sd00054-oi00005-ambassadorcorewallet
    br-ms-sd00103-oi00007-createpaymentcorewallet
    br-ms-sd00103-oi00013-getinformationcharge
  )

  for repository in "${repositories[@]}"; do
    printf "Cloning repository '%s'\n\n" "$repository"
    /bin/bash -c "git clone git@bitbucket.org:banco_ripley/$repository.git"
  done
}

get_repositories
