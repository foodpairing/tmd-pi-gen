#!/bin/bash -e

install -v -m 700 -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/tmd/.ssh"
install -v -m 600 -o 1000 -g 1000 files/authorized_keys "${ROOTFS_DIR}/home/tmd/.ssh/authorized_keys"
