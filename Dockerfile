FROM alpine:3.12.0

WORKDIR /etc/gobackup

COPY run.sh run.sh

RUN apk --no-cache add curl && apk --no-cache add bash
RUN curl -sSL https://git.io/gobackup | bash
RUN apk add postgresql-client && apk add mysql-client

# install go-cron
RUN curl -L --insecure https://github.com/odise/go-cron/releases/download/v0.0.6/go-cron-linux.gz | zcat > /usr/local/bin/go-cron && chmod u+x /usr/local/bin/go-cron

CMD ["./run.sh"]