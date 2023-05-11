#!/bin/bash

function get_repositories {
  local repositories=(
    br-ms-sd00103-oi00012-corewalletsaga
    br-ms-sd00102-oi00015-remittiancepayment
    br-ms-sd00103-oi00008-capturemoneycorewallet
    br-ms-sd00054-oi00005-ambassadorcorewallet
    br-ms-sd00054-oi00003-ambassadorremittances
    br-ms-sd00103-oi00011-reversetechniquecorewallet
    br-ms-sd00103-io00013-getinformationcharge
    br-ms-sd00103-oi00007-createpaymentcorewallet
    br-ms-sd00102-oi00016-remittancestatusnotification
    br-ms-sd00103-oi00014-processremittancestatus
    br-ms-sd00103-oi00016-savemovements
    br-ms-sd00103-oi00017-getmovements
    br-ms-sd00025-oi00004-sendemail
    br-ms-sd00054-oi00007-processwalletauthorization
    br-ms-sd00054-oi00006-walletautorizationnotification
  )

  for repository in "${repositories[@]}"; do
    printf "Cloning repository '%s'\n\n" "$repository"
    /bin/bash -c "git clone git@bitbucket.org:banco_ripley/$repository.git"
  done
}

get_repositories
