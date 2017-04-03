DNS for UniFi Controller
========================

A DNS server to be used for device adoption in the Unifi controller.

## Example

```
$ docker run -d --name=unifi-dns \
             -p 53:53/tcp \
             -p 53:53/udp \
             -e UNIFI_CONTROLLER_IP=192.168.179.2 \
             -e UNBOUND_LOG_QUERIES=yes \
             erlend/unifi:dns
$ dig unifi @localhost
;; ->>HEADER<<- opcode: QUERY, rcode: NOERROR, id: 26612
;; flags: qr aa rd ra ; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0
;; QUESTION SECTION:
;; unifi.       IN      A

;; ANSWER SECTION:
unifi.  3600    IN      A       192.168.179.2
...
```
