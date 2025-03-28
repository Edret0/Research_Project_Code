#!/usr/bin/env bash

pacman -S fio 

mkfs.ext4 -f /dev/sda
mkfs.xfs -F /dev/sdb
mkfs.btrfs -f /dev/sdc

mkdir /mnt/ext4
mkdir /mnt/xfs
mkdir /mnt/btrfs

mount /dev/sda /mnt/ext4
mount /dev/sdb /mnt/xfs
mount /dev/sdc /mnt/btrfs

fio --name=ext4-test --ioengine=sync --size=1G --numjobs=1 --runtime=30m --time_based --rw=randwrite --blocksize=4k --directory=/mnt/ext4
fio --name=xfs-test --ioengine=sync --size=1G --numjobs=1 --runtime=30m --time_based --rw=randwrite --blocksize=4k --directory=/mnt/xfs
fio --name=btrfs-test --ioengine=sync --size=1G --numjobs=1 --runtime=30m --time_based --rw=randwrite --blocksize=4k --directory=/mnt/btrfs

