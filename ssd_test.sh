#!/usr/bin/env bash

fio --name=flash-wear --ioengine=sync --rw=randwrite --bs=4k --size=5G --numjobs=50 --runtime=10m --time_based --verify=none --filename=/dev/vda --direct=1 --output=fio_flash_wear_vda.log
fio --name=flash-wear --ioengine=sync --rw=randwrite --bs=4k --size=5G --numjobs=50 --runtime=10m --time_based --verify=none --filename=/dev/vdb --direct=1 --output=fio_flash_wear_vdb.log
fio --name=flash-wear --ioengine=sync --rw=randwrite --bs=4k --size=5G --numjobs=50 --runtime=10m --time_based --verify=none --filename=/dev/vdc --direct=1 --output=fio_flash_wear_vdc.log


fio --name=bad-blocks --ioengine=sync --rw=write --bs=512 --size=1G --numjobs=50 --runtime=5m --time_based --verify=meta --verify_fatal=1 --filename=/dev/vda --direct=1 --output=fio_bad_blocks_vda.log
fio --name=bad-blocks --ioengine=sync --rw=write --bs=512 --size=1G --numjobs=50 --runtime=5m --time_based --verify=meta --verify_fatal=1 --filename=/dev/vdb --direct=1 --output=fio_bad_blocks_vdb.log
fio --name=bad-blocks --ioengine=sync --rw=write --bs=512 --size=1G --numjobs=50 --runtime=5m --time_based --verify=meta --verify_fatal=1 --filename=/dev/vdc --direct=1 --output=fio_bad_blocks_vdc.log

fio --name=trim-fail --ioengine=sync --rw=trimwrite --bs=4k --size=5G --numjobs=50 --runtime=10m --time_based --filename=/dev/vda --direct=1 --output=fio_trim_fail_vda.log
fio --name=trim-fail --ioengine=sync --rw=trimwrite --bs=4k --size=5G --numjobs=50 --runtime=10m --time_based --filename=/dev/vdb --direct=1 --output=fio_trim_fail_vdb.log
fio --name=trim-fail --ioengine=sync --rw=trimwrite --bs=4k --size=5G --numjobs=50 --runtime=10m --time_based --filename=/dev/vdc --direct=1 --output=fio_trim_fail_vdc.log

fio --name=waf-increase --ioengine=sync --rw=randwrite --bs=512 --size=5G --numjobs=50 --runtime=10m --time_based --filename=/dev/vda --direct=1 --output=fio_waf_increase_vda.log
fio --name=waf-increase --ioengine=sync --rw=randwrite --bs=512 --size=5G --numjobs=50 --runtime=10m --time_based --filename=/dev/vdb --direct=1 --output=fio_waf_increase_vdb.log
fio --name=waf-increase --ioengine=sync --rw=randwrite --bs=512 --size=5G --numjobs=50 --runtime=10m --time_based --filename=/dev/vdc --direct=1 --output=fio_waf_increase_vdc.log

