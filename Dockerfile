FROM jsurf/rpi-raspbian:latest
MAINTAINER Jens Viebig jsurf@gmx.de

RUN [ "cross-build-start" ]

ENV TZ Europe/Berlin

RUN apt-get update \
    && apt-get install -y ser2net \
    && rm -rf /var/lib/apt/lists/*

ADD ser2net.conf /etc/ser2net.conf

EXPOSE 3333

CMD /usr/sbin/ser2net -d -u

RUN [ "cross-build-end" ]