#!/bin/bash

#!/usr/bin/env bash
set -x

# SIGTERM-handler
term_handler() {
  echo "SIGTERM trapped! Suspending all rstudio sessions"
  su rstudio -c "rstudio-server suspend-all -w"
  exit 0
}

# setup handlers
trap 'kill ${!}; term_handler' SIGTERM

# run application
rstudio-server start

# wait forever
while true
do
  tail -f /dev/null & wait ${!}
done