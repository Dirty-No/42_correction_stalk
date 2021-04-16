#!/bin/bash

LOGIN="$1"
PROJECT="$2"

MAILS="$(cat $3 | tr '\n' ' ')"
FILE=$HOME/."$LOGIN"_"$PROJECT"
sendmail=msmtp

if [ "$3" = "reset" ];then
	rm $FILE
fi

if [ -f "$FILE" ]; then
    exit 1
fi

PROJECT_PAGE=$(curl -s -b cookies.txt https://projects.intra.42.fr/$PROJECT/$LOGIN)
if [ "$PROJECT_PAGE" = "{}" ] || [ ! -z "$(echo $PROJECT_PAGE | grep redirected)" ] ;then
	PROJECT_PAGE=$(curl -s -b cookies.txt https://projects.intra.42.fr/42cursus-$PROJECT/$LOGIN)
fi
FLAG=$(echo "$PROJECT_PAGE" | grep "and closed")
if [ -z "$FLAG" ];then
	echo KO
	exit 1
fi

echo OK
$sendmail $MAILS << EOF 
Subject: [42_BIGBROTHER] $LOGIN vient de close $PROJECT.

$(date)
$LOGIN vient de close sa team pour le projet $PROJECT.
EOF
touch $FILE

