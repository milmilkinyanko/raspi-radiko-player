#!/bin/bash

PATH_TO_OPENVPN_CONFIG='/home/hoge/fuga.ovpn'

# signal handler
trap 'openvpn3 session-manage --disconnect --config $PATH_TO_OPENVPN_CONFIG; bluetoothctl << EOF
disconnect
power off
EOF' INT TERM

# bluetooth connection
expect bluetooth.tcl

# vpn connection
openvpn3 session-start --config $PATH_TO_OPENVPN_CONFIG

# play radiko
streamlink -p mpv https://radiko.jp/#!/live/FMT best
