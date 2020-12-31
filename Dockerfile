# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: ioQuake3
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM alpine

MAINTAINER samicrusader, <hi@samicrusader.me>

RUN apk add --no-cache --update sdl2 sdl2-dev git build-base gcc wget mesa-dev && adduser -D -h /home/container container

USER container
ENV  USER=container HOME=/home/container
WORKDIR /home/container

COPY ./installdemo.sh /installdemo.sh
COPY ./installconfig.sh /installconfig.sh

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/ash", "/entrypoint.sh"]
