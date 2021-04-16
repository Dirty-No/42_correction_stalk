#!/bin/bash

get_abs_filename() {
  # $1 : relative filename
  echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

LOGIN=$1
PROJECT=$2
MAILS=$(get_abs_filename $3)

crontab -l > /tmp/mycron
echo "* * * * * bash -c 'cd $(pwd) && ./check.sh $LOGIN $PROJECT $MAILS'" >> /tmp/mycron
crontab /tmp/mycron
rm /tmp/mycron
