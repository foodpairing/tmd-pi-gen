#!/bin/bash -e

BARTENDRO_DIR=usr/local/lib/python2.7/dist-packages/bartendro
CONFIG_DIR=home/tmd/bartendro

# install tmd_bartendro python package
on_chroot <<EOF
pip install --extra-index-url "${GEMFURY_URL}" tmd_bartendro
EOF

# create config dir and copy example config
install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/${CONFIG_DIR}"
install -v -o 1000 -g 1000 -m 600 ${ROOTFS_DIR}/${BARTENDRO_DIR}/example/* ${ROOTFS_DIR}/${CONFIG_DIR}/

# install systemd service
install -v -m 644 files/bartendro.service "${ROOTFS_DIR}/etc/systemd/system/bartendro.service"

on_chroot <<EOF
systemctl enable bartendro
EOF

# install nginx config
install -v -m 644 files/bartendro.nginx "${ROOTFS_DIR}/etc/nginx/sites-available/default"
