#!/bin/bash
#
#
#     )\-"```-,_
#    /.   _     `"-._
#   _`-c_/_'. `\   , `"-._
#  (_.--`  '-_;-'   \     `"-.
#          (_.-----'`-.._     `\._
#                        `\     `\'._
#                          `'.    '._'._
#                             `'---, `._'-._
#                                   `-._/'--'


LOCUST="/usr/local/bin/locust"
LOCUST_FILE=${LOCUST_FILE:-'tasks.py'}
LOCUST_OPTS="-f /locust/py-locustfiles/${LOCUST_FILE} --host=$TARGET_HOST"
LOCUST_MODE=${LOCUST_MODE:-standalone}

if [[ "$LOCUST_MODE" = "master" ]]; then
    LOCUST_OPTS="$LOCUST_OPTS --master"
elif [[ "$LOCUST_MODE" = "worker" ]]; then
    LOCUST_OPTS="$LOCUST_OPTS --slave --master-host=$LOCUST_MASTER"
fi

echo "$LOCUST $LOCUST_OPTS"

$LOCUST $LOCUST_OPTS
