# docker-forward
used to forward ports

## usage

The following environment variables need to be defined

1. `TARGET_HOST` host you want to forward to (default `172.17.0.1` is the docker host)
2. `TARGET_PORT` port on target host to forward to
3. `SOURCE_PORT` port which is opened on the docker container to accept connections from (default to `80`)

port `SOURCE_PORT` inside the container will be forwarded to the target host and port

* use `-P` to have docker pick a random port on the host to forward
* use `-p <host_port>:80` to define a custom port to forward where `host_port` is the port on the host that needs to be forwarded

## examples

### Docker

The following will forward local host traffic from port 8080 to target host 10.32.0.1 and port 27017.

```
docker run -e TARGET_HOST=10.32.0.1 -e TARGET_PORT=27017 -p 8080:80 madnificent/port-forward
```

### Docker Compose

The following will forward port 80 of `service-name` to port 8080 of your local host.

```
services:
  service-name:
    image: madnificent/forward
    environment:
      TARGET_PORT: 8080
```
