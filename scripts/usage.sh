#!/bin/bash

function usage {
  echo "Usage: $(basename "$0") [-gdh]" 2>&1
  echo '   -g   clone all required repositories'
  echo '   -d   add Docker related files'
  echo '   -n   install Node dependencies on each repository'
  echo '   -h   show this help message'
  exit 0
}

usage
