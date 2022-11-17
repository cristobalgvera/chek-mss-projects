#!/bin/bash

function get_repositories {
  local repositories=(
    br-ms-sd00054-oi00003-ambassadorremittances
    br-ms-sd00102-oi00015-remittiancepayment
    br-ms-sd00102-oi00016-webhookremittances
    br-ms-sd00103-io00004-createremittancequote
    br-ms-sd00103-oi00005-remittanceadmitquote
    br-ms-sd00205-oi00006-getremittancebanks
    br-ms-sd00205-oi00007-getremittancepayers
    br-ms-sd00205-oi00009-getremittanceflags
  )

  for repository in "${repositories[@]}"; do
    printf "\nCloning repository '%s'\n" "$repository"
    /bin/bash -c "git clone git@bitbucket.org:banco_ripley/$repository.git"
  done
}

get_repositories
