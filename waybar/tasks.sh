#!/usr/bin/env bash

task +PENDING due.before:3d _unique id |wc -l
