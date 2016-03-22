#!/bin/bash

set -e

env | grep mounts | sed 's/.*=//'  |sed -n 1'p' | tr ',' '\n' | while read mount; do 
   src=$(echo $mount | awk -F':' '{ print $1 }')
   echo "$src *(rw,sync,no_subtree_check,no_root_squash)" >> /etc/exports
done

exec runsvdir /etc/sv
