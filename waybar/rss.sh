#!/usr/bin/env bash
newsboat -x reload &>/dev/null
count=$(sqlite3 ~/.local/share/newsboat/cache.db "select count(DISTINCT feedurl) from rss_item where unread = 1")

((count < 1)) && exit 1

echo "$count"
