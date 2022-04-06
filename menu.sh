#!/usr/bin/env sh
# Prerequisite: curl, w3m
curl -s --cipher 'DEFAULT:!DH' -k \
	"https://192.168.25.28/~mess/ShowMenu.php?OpenMonth=$(date +%m)&Style=1" > /tmp/menu.html
w3m -dump /tmp/menu.html | tail -n +3|head -n -2 | sed '/None$/d' |\
	sed  "s/$(date +%-d) of $(date +%B)/& (Today)/" |\
	grep --colour -e Chicken -e ^ -e SID -e Egg -e Today -e B:
