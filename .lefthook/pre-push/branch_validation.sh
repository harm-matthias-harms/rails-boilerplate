#!/bin/bash

BRANCH=$(git rev-parse --abbrev-ref HEAD)
REGEX="^(bug|feature|chore|dependency)/.+$"

if ! [[ $BRANCH =~ $REGEX ]]; then
  echo "Your push was rejected due to branching name"
  echo "Please rename your branch with '(bug|feature|chore|dependency)/.+' syntax"
  exit 1
fi
