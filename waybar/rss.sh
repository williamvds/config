#!/usr/bin/env bash
count="$(newsboat -x print-unread |cut -d' ' -f1)"

((count < 1)) && exit 1

echo "$count"
