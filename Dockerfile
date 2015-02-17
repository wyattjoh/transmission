FROM phusion/baseimage:0.9.15
MAINTAINER needo <needo@superhero.org>
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody
RUN usermod -g 100 nobody

RUN add-apt-repository ppa:transmissionbt/ppa
ADD sources.list /etc/apt/
RUN apt-get update -qq
RUN apt-get install -qy transmission-cli transmission-common transmission-daemon

# Path to a directory that only contains the transmission.conf
VOLUME /config
VOLUME /downloads

EXPOSE 9091
EXPOSE 51413

# Add transmission to runit
RUN mkdir /etc/service/transmission
ADD transmission.sh /etc/service/transmission/run
RUN chmod +x /etc/service/transmission/run
