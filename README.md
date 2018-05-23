# redis-sentinel-health

Docker (alpine-based) container to monitor a Redis Sentinel environment

This service is based on [Chris Boulton's](https://gist.github.com/chrisboulton) [script](https://gist.github.com/chrisboulton/11337032#file-check_sentinel_master_health)

[![nodesource/node](http://dockeri.co/image/mingalevme/redis-sentinel-health)](https://hub.docker.com/r/mingalevme/redis-sentinel-health/)

## Installation

```
docker pull mingalevme/redis-sentinel-health
```

# Usage

```bash
# Replace environment variables with yours.
$ docker run --rm mingalevme/redis-sentinel-health -h localhost -p 26379 -m mymaster
OK - 2/2 slaves healthy. 3/3 sentinels healthy
$ echo $?
0
```
