#! /bin/sh

set -e
./yaml-variables-cli /etc/gobackup/gobackup.template.yml /etc/gobackup/gobackup.yml
exec go-cron "$SCHEDULE" /usr/local/bin/gobackup perform >> ~/.gobackup/gobackup.log