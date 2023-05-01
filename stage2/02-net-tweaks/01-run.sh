#!/bin/bash -e

on_chroot << EOF
	SUDO_USER="${FIRST_USER_NAME}" raspi-config nonint do_boot_wait 0
#	SUDO_USER="${FIRST_USER_NAME}" raspi-config nonint do_netconf 1
	SUDO_USER="${FIRST_USER_NAME}" raspi-config nonint do_net_names 0
EOF
