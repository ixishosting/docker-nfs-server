#!/bin/bash


env | grep mounts | sed 's/.*=//' | sed -n 1'p' | tr ',' '\n' | while read mount; do
   echo "$mount *(rw,sync,no_subtree_check,no_root_squash,sec=sys,bg,hard,nointr,suid,cio)" >> /etc/exports;
done

exec runsvdir /etc/sv
