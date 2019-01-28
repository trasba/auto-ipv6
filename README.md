# auto-ipv6
* Set ipv6 address
* run neighbor discovery
* set route to gateway via dev
* set default gateway via dev

has to be executed as root

### initialize
copy config.example to copy and adjust values

### autostart
e.g. put into crontab via\
```sudo crontab -e```\
add \
```@reboot <path-to-script>ipv6.sh```
