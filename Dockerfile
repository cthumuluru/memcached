FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -qq memcached

EXPOSE 11211/tcp

ENTRYPOINT ["/usr/bin/memcached", "-m 64", "-u memcache", "-p 11211"]
