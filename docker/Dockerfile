FROM golang:1.14 as builder

RUN go get github.com/asmith030/go-clamav-rest
WORKDIR /go/src/github.com/asmith030/go-clamav-rest

RUN CGO_ENABLED=0 GOOS=linux go install -v \
            github.com/asmith030/go-clamav-rest

FROM ubuntu:focal

RUN apt-get update ; apt-get -y install clamav-daemon libclamunrar9 ca-certificates

COPY --chown=clamav:clamav ./*.conf /etc/clamav/
COPY --chown=clamav:clamav eicar.com /
COPY --chown=clamav:clamav ./*.sh /
COPY --from=builder /go/bin/go-clamav-rest /go-clamav-rest

RUN mkdir /var/run/clamav && \
    chown clamav:clamav /var/run/clamav && \
    chmod 750 /var/run/clamav

USER 101

VOLUME /var/lib/clamav

ENTRYPOINT ["clamd"]
