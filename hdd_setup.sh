#!/usr/bin/env bash

pacman -S fio 

mkfs.ext4 -f /dev/sda
mkfs.xfs -F /dev/sdb
mkfs.btrfs -f /dev/sdc

mkdir /mnt/ext4
mkdir /mnt/xfs
mkdir /mnt/btrfs

#Simulating failures on the three drives



