#!/bin/bash -e

install -m 644 files/50-main.network     "${ROOTFS_DIR}/etc/systemd/network/50-main.network"

install -m 644 files/01-net.link         "${ROOTFS_DIR}/etc/systemd/network/01-net.link"
install -m 644 files/02-usb.link         "${ROOTFS_DIR}/etc/systemd/network/02-usb.link"
install -m 644 files/03-wifi.link        "${ROOTFS_DIR}/etc/systemd/network/03-wifi.link"

on_chroot << EOF

ln -rsf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
systemctl disable networking
systemctl enable systemd-networkd systemd-resolved

sudo sed -i.bak 's/#\?DNSSEC=.*$/DNSSEC=no/' /etc/systemd/resolved.conf

EOF
