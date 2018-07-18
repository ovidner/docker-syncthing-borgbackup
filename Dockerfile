FROM alpine:edge

ENV APP_ROOT=/app
ENV PATH=${APP_ROOT}/bin:${PATH}

RUN mkdir -p ${APP_ROOT}
WORKDIR ${APP_ROOT}

RUN apk add --no-cache borgbackup su-exec syncthing

COPY . ${APP_ROOT}/

EXPOSE 8384 22000 21027/udp
HEALTHCHECK --interval=1m --timeout=10s \
  CMD nc -z localhost 8384 || exit 1
ENTRYPOINT ["entrypoint"]
CMD ["run-syncthing"]
