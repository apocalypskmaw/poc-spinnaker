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
LOCUS_OPTS="-f /locust/py-locustfiles/${LOCUST_FILE} --host=$TARGET_HOST"
LOCUST_MODE=${LOCUST_MODE:-standalone}

if [[ "$LOCUST_MODE" = "master" ]]; then
    LOCUS_OPTS="$LOCUS_OPTS --master"
elif [[ "$LOCUST_MODE" = "worker" ]]; then
    LOCUS_OPTS="$LOCUS_OPTS --slave --master-host=$LOCUST_MASTER"
fi

echo "$LOCUST $LOCUS_OPTS"

$LOCUST $LOCUS_OPTS
