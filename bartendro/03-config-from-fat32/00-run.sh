#!/bin/bash -e

install -v -m 644 files/tmpfiles.d.tmd_config.conf "${ROOTFS_DIR}/etc/tmpfiles.d/tmd_config.conf"
install -v -m 644 "${ROOTFS_DIR}/home/tmd/bartendro/config.json" "${ROOTFS_DIR}/boot/config.json"
