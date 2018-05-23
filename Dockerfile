FROM ruby:2.5-alpine

ARG BUILD_DATE
ARG VCS_REF

LABEL MAINTAINER=mingalevme@gmail.com \
      org.label-schema.schema-version="1.0" \
      org.label-schema.name="Redis Sentinel health checker" \
      org.label-schema.description="This service is based on Chris Boulton's (https://gist.github.com/chrisboulton) script (https://gist.github.com/chrisboulton/11337032#file-check_sentinel_master_health)" \
      org.label-schema.version="0.9.0" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/mingalevme/redis-sentinel-health" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.docker.cmd="docker run --rm -e SENTINEL_HOST=localhost -e SENTINEL_HOST=26379 -e SENTINEL_MASTER=mymaster mingalevme/redis-sentinel-health"

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
