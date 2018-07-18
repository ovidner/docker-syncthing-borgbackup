FROM alpine:edge

ENV APP_ROOT=/app
ENV PATH=${APP_ROOT}/bin:${PATH}

RUN mkdir -p ${APP_ROOT}
WORKDIR ${APP_ROOT}

RUN apk add --no-cache borgbackup su-exec syncthing

COPY . ${APP_ROOT}/

ENTRYPOINT ["entrypoint"]
CMD ["run-syncthing"]
