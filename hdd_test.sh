#!/usr/bin/env bash\


sudo dd if=/dev/urandom of=/dev/sda bs=4k seek=1000 conv=fdatasync status=progress > dd_output.log 2>&1
sudo dd if=/dev/urandom of=/dev/sdb bs=4k seek=1000 conv=fdatasync status=progress > dd_output.log 2>&1
sudo dd if=/dev/urandom of=/dev/sdc bs=4k seek=1000 conv=fdatasync status=progress > dd_output.log 2>&1


fio --name=bad-blocks --ioengine=sync --rw=randwrite --bs=512 --size=1G --numjobs=8 --runtime=5m --time_based --filename=/dev/sda --direct=1 --output=fio_badblocks_sda.log
fio --name=bad-blocks --ioengine=sync --rw=randwrite --bs=512 --size=1G --numjobs=8 --runtime=5m --time_based --filename=/dev/sdb --direct=1 --output=fio_badblocks_sdb.log
fio --name=bad-blocks --ioengine=sync --rw=randwrite --bs=512 --size=1G --numjobs=8 --runtime=5m --time_based --filename=/dev/sdc --direct=1 --output=fio_badblocks_sdc.log

# fio --name=repeated-writes --ioengine=sync --rw=write --size=20G --bs=4k --numjobs=4 --runtime=5m --time_based --output=fio_repeated_writes_sda.log --filename=/dev/sda
# fio --name=repeated-writes --ioengine=sync --rw=write --size=20G --bs=4k --numjobs=4 --runtime=5m --time_based --output=fio_repeated_writes_sdb.log --filename=/dev/sdb
# fio --name=repeated-writes --ioengine=sync --rw=write --size=20G --bs=4k --numjobs=4 --runtime=5m --time_based --output=fio_repeated_writes_sdc.log --filename=/dev/sdc
#
# fio --name=fragmentation-test --ioengine=sync --rw=randwrite --size=20G --bs=4k --numjobs=8 --runtime=10m --time_based --output=fio_fragmentation_sda.log --filename=/dev/sda
# fio --name=fragmentation-test --ioengine=sync --rw=randwrite --size=20G --bs=4k --numjobs=8 --runtime=10m --time_based --output=fio_fragmentation_sdb.log --filename=/dev/sdb
# fio --name=fragmentation-test --ioengine=sync --rw=randwrite --size=20G --bs=4k --numjobs=8 --runtime=10m --time_based --output=fio_fragmentation_sdc.log --filename=/dev/sdc
