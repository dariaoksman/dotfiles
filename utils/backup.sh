#!/bin/bash

rdiff-backup /boot /mnt/backups/rdiff-backups/nvme0n1p7
rdiff-backup --exclude '/mnt/*' --exclude '/tmp/*' --exclude '/proc/*' --exclude '/sys/*' --exclude '/boot/*' / /mnt/backups/rdiff-backups/nvme0n1p9
