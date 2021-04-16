#!/bin/bash

cat > /etc/msmtprc << EOF 
defaults
auth           on
tls            on
tls_starttls   on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
logfile        /var/log/msmtp.log

account        gmail
auth           plain
host           smtp.gmail.com
port           587
from           $MAIL_ADDRESS
user           $MAIL_USER
password       $MAIL_PASS

account default : gmail
EOF
