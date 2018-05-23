FROM ruby:2.5-alpine

LABEL MAINTAINER=mingalevme@gmail.com
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name="Redis Sentinel health checker"
LABEL org.label-schema.description="This service is based on Chris Boulton's \
(https://gist.github.com/chrisboulton) script (https://gist.github.com/chrisboulton/11337032#file-check_sentinel_master_health)"
LABEL org.label-schema.version="0.9.0"
LABEL org.label-schema.vcs-url="https://github.com/mingalevme/redis-sentinel-health"
LABEL org.label-schema.docker.cmd="docker run --rm -e SENTINEL_HOST=localhost -e SENTINEL_HOST=26379 -e SENTINEL_MASTER=mymaster mingalevme/redis-sentinel-health"

RUN apk update && apk upgrade && \
    apk add curl wget bash curl-dev build-base && \
    apk add redis && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /app

WORKDIR /app

RUN gem install redis

ENV SENTINEL_HOST localhost
ENV SENTINEL_PORT 26379
ENV SENTINEL_MASTER mymaster

COPY . ./

CMD ["sh", "-c", "/usr/local/bin/ruby health.rb -h ${SENTINEL_HOST} -p ${SENTINEL_PORT} -m ${SENTINEL_MASTER}"]
