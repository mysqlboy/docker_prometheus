FROM debian:jessie
MAINTAINER andrew.moore@percona.com

WORKDIR /
RUN apt-get update -qq
RUN apt-get install -yq wget vim tar gzip
RUN wget https://github.com/prometheus/prometheus/releases/download/0.16.1/prometheus-0.16.1.linux-amd64.tar.gz
RUN tar zxf prometheus-0.16.1.linux-amd64.tar.gz
WORKDIR prometheus-0.16.1.linux-amd64
ADD $PWD/prom.yml /prometheus-0.16.1.linux-amd64/prometheus.yml

CMD ./prometheus -config.file=prometheus.yml -storage.local.retention=168h
