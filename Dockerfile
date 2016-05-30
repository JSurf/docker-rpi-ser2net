FROM jsurf/rpi-raspbian:latest
MAINTAINER Jens Viebig jsurf@gmx.de

RUN [ "cross-build-start" ]

ENV TZ Europe/Berlin

RUN apt-get update \
    && apt-get install -y ser2net supervisor \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/log/supervisor

ADD ser2net.conf /etc/ser2net.conf
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 3333

CMD ["/usr/bin/supervisord"]

RUN [ "cross-build-end" ]