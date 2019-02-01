#!/bin/bash -e

on_chroot << EOF
systemctl mask serial-getty@ttyS0.service
systemctl mask serial-getty@ttyAMA0.service
EOF
