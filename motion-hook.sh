#!/bin/sh

## Variables

NOTIFY_HEADER="Visitor"
NOTIFY_MESSAGE=""
NOTIFY_URGENCY="normal"

# Seconds between notifications at minimum
VISITOR_DELAY=15

# Address of the http server to get the image from
BROADCAST_ADDR=127.0.0.1:8081
LOCKFILE="motion-hook"

## Begin execution
set -e
lockfile-create -q -r 0 "$LOCKFILE"

notify-send "$NOTIFY_HEADER" "$NOTIFY_MESSAGE" --urgency="$NOTIFY_URGENCY"

sleep "$VISITOR_DELAY"
lockfile-remove -q "$LOCKFILE"
exit 0
