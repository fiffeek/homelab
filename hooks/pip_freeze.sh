#!/bin/bash

pip freeze | sed 's/_/-/g' |
  awk -F '==' '{ printf "%s==%s\n", tolower($1), $2 }' \
    >requirements.txt
