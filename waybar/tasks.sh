#!/usr/bin/env bash
task sync &>/dev/null

res=$(task +PENDING due.before:3d _unique id |wc -l)

((res < 1)) && exit 1

echo "$res"
