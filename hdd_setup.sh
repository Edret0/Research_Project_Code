#!/usr/bin/env bash

pacman -S fio 

mkfs.ext4 -f /dev/sda
mkfs.xfs -F /dev/sdb
mkfs.btrfs -f /dev/sdc

mkdir /mnt/ext4
mkdir /mnt/xfs
mkdir /mnt/btrfs

#Simulating failures on the three drives

sudo dd if=/dev/urandom of=/dev/sda bs=4k seek=1000 conv=fdatasync status=progress > dd_output.log 2>&1
sudo dd if=/dev/urandom of=/dev/sdb bs=4k seek=1000 conv=fdatasync status=progress > dd_output.log 2>&1
sudo dd if=/dev/urandom of=/dev/sdc bs=4k seek=1000 conv=fdatasync status=progress > dd_output.log 2>&1


fio --name=latency-test --ioengine=sync --rw=randwrite --size=20G --bs=4k --numjobs=4 --runtime=60s --time_based  --output=fio_latency_results_sda.log --filename=/dev/sda
fio --name=latency-test --ioengine=sync --rw=randwrite --size=20G --bs=4k --numjobs=4 --runtime=60s --time_based  --output=fio_latency_results_sdb.log --filename=/dev/sdb
fio --name=latency-test --ioengine=sync --rw=randwrite --size=20G --bs=4k --numjobs=4 --runtime=60s --time_based  --output=fio_latency_results_sdc.log --filename=/dev/sdc

fio --name=repeated-writes --ioengine=sync --rw=write --size=20G --bs=4k --numjobs=4 --runtime=5m --time_based --output=fio_repeated_writes_sda.log --filename=/dev/sda
fio --name=repeated-writes --ioengine=sync --rw=write --size=20G --bs=4k --numjobs=4 --runtime=5m --time_based --output=fio_repeated_writes_sdb.log --filename=/dev/sdb
fio --name=repeated-writes --ioengine=sync --rw=write --size=20G --bs=4k --numjobs=4 --runtime=5m --time_based --output=fio_repeated_writes_sdc.log --filename=/dev/sdc

fio --name=fragmentation-test --ioengine=sync --rw=randwrite --size=20G --bs=4k --numjobs=8 --runtime=10m --time_based --output=fio_fragmentation_sda.log --filename=/dev/sda
fio --name=fragmentation-test --ioengine=sync --rw=randwrite --size=20G --bs=4k --numjobs=8 --runtime=10m --time_based --output=fio_fragmentation_sdb.log --filename=/dev/sdb
fio --name=fragmentation-test --ioengine=sync --rw=randwrite --size=20G --bs=4k --numjobs=8 --runtime=10m --time_based --output=fio_fragmentation_sdc.log --filename=/dev/sdc


