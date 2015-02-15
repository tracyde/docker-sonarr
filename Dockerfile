FROM debian:wheezy
MAINTAINER tracyde <tracyde@gmail.com>

# mono 3.10 currently doesn't install in debian jessie due to libpeg8 being removed.

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8
ENV LC_ALL C.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apt-get -q update
RUN apt-get -qy --force-yes dist-upgrade

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC \
  && echo "deb http://apt.sonarr.tv/ master main" > /etc/apt/sources.list.d/sonarr.list \
  && apt-get update -q \
  && apt-get install -qy nzbdrone mediainfo \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN chown -R nobody:users /opt/NzbDrone \
  ; mkdir -p /volumes/config/sonarr /volumes/completed /volumes/media \
  && chown -R nobody:users /volumes

VOLUME /config
VOLUME /data
VOLUME /media

ADD ./start.sh /start.sh
RUN chmod u+x /start.sh

ADD ./sonarr-update.sh /sonarr-update.sh
RUN chmod 755 /sonarr-update.sh

EXPOSE 8989
EXPOSE 9898

CMD ["/start.sh"]
