FROM resin/rpi-raspbian:jessie
MAINTAINER Jens Viebig jsurf@gmx.de

RUN apt-get update \
    && apt-get install -y ser2net supervisor \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/log/supervisor

ADD ser2net.conf /etc/ser2net.conf
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 3333

CMD ["/usr/bin/supervisord"]
