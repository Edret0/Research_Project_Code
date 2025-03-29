#!/usr/bin/env bash

pacman -S fio 

mkfs.ext4 -f /dev/vda
mkfs.xfs -F /dev/vdb
mkfs.btrfs -f /dev/vdc

mkdir /mnt/ext4
mkdir /mnt/xfs
mkdir /mnt/btrfs




