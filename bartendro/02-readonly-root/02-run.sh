#!/bin/bash -e

# install tmd_bartendro python package
on_chroot <<EOF
# generate SSH host keys (yes, these will be the same for all devices that use the same image build)
dpkg-reconfigure openssh-server
EOF

# from http://hallard.me/raspberry-pi-read-only/
rm -rf "${ROOTFS_DIR}/var/lib/dhcp/" "${ROOTFS_DIR}/var/run" "${ROOTFS_DIR}/var/spool" "${ROOTFS_DIR}/var/lock"
ln -s /tmp "${ROOTFS_DIR}/var/lib/dhcp"
ln -s /tmp "${ROOTFS_DIR}/var/run"
ln -s /tmp "${ROOTFS_DIR}/var/spool"
ln -s /tmp "${ROOTFS_DIR}/var/lock"

rm -rf "${ROOTFS_DIR}/var/lib/nginx"
ln -s /tmp "${ROOTFS_DIR}/var/lib/nginx"

install -v -m 644 files/tmpfiles.d.tmd.conf "${ROOTFS_DIR}/etc/tmpfiles.d/tmd.conf"
