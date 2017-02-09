UniFi Controller
================

## Configuration

### Ports

| Port   | Config            | Description                                           |
|--------|-------------------|-------------------------------------------------------|
| `8080` | unifi.http.port   | port for UAP to inform controller                     |
| `8443` | unifi.https.port  | port for controller GUI / API, as seen in web browser |
| `8880` | portal.http.port  | port for HTTP portal redirect                         |
| `8843` | portal.https.port | port for HTTPS portal redirect                        |
| `3478` | unifi.stun.port   | UDP port used for STUN                                |

### Volumes

Make sure you keep the data in `/var/lib/unifi` safe by binding it with `-v` or
`--volumes-from`.

### Advanced

You can add your own arguments to be passed to java with docker's command. The
default is `-Xmx1024M`, which limits java to 1024 MB of memory.

```
docker run --rm -it erlend/unifi -Xmx2048M
```
