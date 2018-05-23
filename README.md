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
docker run --rm -e SENTINEL_HOST=localhost -e SENTINEL_HOST=26379 -e SENTINEL_MASTER=mymaster mingalevme/redis-sentinel-health
```
