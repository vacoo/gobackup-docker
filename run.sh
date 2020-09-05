#! /bin/sh

set -e

exec go-cron "$SCHEDULE" /usr/local/bin/gobackup perform >> ~/.gobackup/gobackup.log