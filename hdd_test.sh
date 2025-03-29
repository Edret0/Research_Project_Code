#!/usr/bin/env bash




fio --name=bad-sectors --ioengine=sync --rw=write --bs=512 --size=1G --numjobs=8 --runtime=5m --time_based --verify=meta --verify_fatal=1 --filename=/dev/sda --direct=1 --output=fio_bad_sectors_sda.log
fio --name=bad-sectors --ioengine=sync --rw=write --bs=512 --size=1G --numjobs=8 --runtime=5m --time_based --verify=meta --verify_fatal=1 --filename=/dev/sdb --direct=1 --output=fio_bad_sectors_sdb.log
fio --name=bad-sectors --ioengine=sync --rw=write --bs=512 --size=1G --numjobs=8 --runtime=5m --time_based --verify=meta --verify_fatal=1 --filename=/dev/sdc --direct=1 --output=fio_bad_sectors_sdc.log

fio --name=latency-test --ioengine=sync --rw=randrw --bs=4k --size=1G --numjobs=8 --runtime=5m --time_based --filename=/dev/sda --direct=1 --output=fio_latency_sda.log
fio --name=latency-test --ioengine=sync --rw=randrw --bs=4k --size=1G --numjobs=8 --runtime=5m --time_based --filename=/dev/sdb --direct=1 --output=fio_latency_sdb.log
fio --name=latency-test --ioengine=sync --rw=randrw --bs=4k --size=1G --numjobs=8 --runtime=5m --time_based --filename=/dev/sdc --direct=1 --output=fio_latency_sdc.log

fio --name=repeated-writes --ioengine=sync --rw=write --bs=4k --size=5G --numjobs=4 --runtime=10m --time_based --filename=/dev/sda --direct=1 --output=fio_repeated_writes_sda.log
fio --name=repeated-writes --ioengine=sync --rw=write --bs=4k --size=5G --numjobs=4 --runtime=10m --time_based --filename=/dev/sdb --direct=1 --output=fio_repeated_writes_sdb.log
fio --name=repeated-writes --ioengine=sync --rw=write --bs=4k --size=5G --numjobs=4 --runtime=10m --time_based --filename=/dev/sdc --direct=1 --output=fio_repeated_writes_sdc.log

fio --name=fragmentation-test --ioengine=sync --rw=randwrite --bs=4k --size=5G --numjobs=8 --runtime=10m --time_based --filename=/dev/sda --direct=1 --output=fio_fragmentation_sda.log
fio --name=fragmentation-test --ioengine=sync --rw=randwrite --bs=4k --size=5G --numjobs=8 --runtime=10m --time_based --filename=/dev/sdb --direct=1 --output=fio_fragmentation_sdb.log
fio --name=fragmentation-test --ioengine=sync --rw=randwrite --bs=4k --size=5G --numjobs=8 --runtime=10m --time_based --filename=/dev/sdc --direct=1 --output=fio_fragmentation_sdc.log

