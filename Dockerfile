FROM ruby:2.5-alpine

ARG BUILD_DATE
ARG VCS_REF

LABEL MAINTAINER=mingalevme@gmail.com \
      org.label-schema.schema-version="1.0" \
      org.label-schema.name="Redis Sentinel health checker" \
      org.label-schema.description="This service is based on Chris Boulton's (https://gist.github.com/chrisboulton) script (https://gist.github.com/chrisboulton/11337032#file-check_sentinel_master_health)" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/mingalevme/redis-sentinel-health" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.docker.cmd="docker run --rm mingalevme/redis-sentinel-health -h localhost -p 26379 -m mymaster"

RUN apk update && apk upgrade && \
    apk add curl wget bash curl-dev build-base && \
    apk add redis && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /app

WORKDIR /app

RUN gem install redis

COPY . ./

ENTRYPOINT ["/usr/local/bin/ruby", "health.rb"]
