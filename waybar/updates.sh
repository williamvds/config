#!/usr/bin/env bash
num=$(checkupdates 2> /dev/null | wc -l)

((num < 1)) && exit 1

echo "$num"
