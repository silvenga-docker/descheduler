FROM golang:1.9.2

WORKDIR /go/src/github.com/kubernetes-incubator/descheduler

RUN set -xe \
    && git clone https://github.com/kubernetes-incubator/descheduler.git /go/src/github.com/kubernetes-incubator/descheduler \
    && make

FROM ubuntu

COPY --from=0 /go/src/github.com/kubernetes-incubator/descheduler/_output/bin/descheduler /bin/descheduler

CMD ["/bin/descheduler", "--help"]