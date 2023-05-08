#!/bin/bash -e

install -m 644 files/04-eth0.network     "${ROOTFS_DIR}/etc/systemd/network/04-eth0.network"

on_chroot << EOF

ln -rsf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
systemctl disable networking
systemctl enable systemd-networkd systemd-resolved

EOF
