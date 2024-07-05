#!/bin/bash

source /root/cv_workspace/libs/setup.sh

if [[ $# -eq 0 ]]; then
  exec "/bin/bash" -l
else
  exec "$@"
fi
