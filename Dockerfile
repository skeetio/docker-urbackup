FROM ubuntu:12.04
MAINTAINER Brian Findlay <bfindlay@comlink.net>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python-software-properties btrfs-tools
RUN add-apt-repository ppa:uroni/urbackup
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y urbackup-server
RUN mkdir -p /media/BACKUP/urbackup
RUN apt-get clean

EXPOSE 55414
ENTRYPOINT ["/usr/sbin/start_urbackup_server"]
CMD ["--no_daemon"]
