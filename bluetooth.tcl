spawn bluetoothctl
expect -regexp ".*#"
send "power on\r"
expect -regexp ".*#"
send "connect D8:6C:63:5D:2E:FF\r"
expect "Connection successful"
send "quit\r"

