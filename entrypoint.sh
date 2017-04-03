#!/bin/ash
set -e
unbound_cfg="/etc/unbound/unbound.conf"

if [ -z "$UNIFI_CONTROLLER_IP" ]]; then
  echo "Error: The UNIFI_CONTROLLER_IP variables is blank"
  exit
fi

cat > $unbound_cfg <<-EOF
server:
    verbosity: 1
    interface: 0.0.0.0
    interface: ::0
    username: "unbound"
    logfile: ""
    set-log-time-ascii: yes
    log-queries: $UNBOUND_LOG_QUERIES
    root-hints: /etc/unbound/root.hints
    hide-identity: yes
    hide-version: yes
    local-zone: "unifi" redirect
    local-data: "unifi IN A $UNIFI_CONTROLLER_IP"
    access-control: 0.0.0.0/0 allow
EOF

if [ -z "$1" ] || [ ${1:0:1} = '-' ]; then
  set -- dumb-init unbound -d $@
fi

exec $@
