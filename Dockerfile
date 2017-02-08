# Set the base image to use to armhf
FROM armbuild/debian:jessie

# reqired packages
RUN apt-get update && apt-get install git build-essential uuid-dev psmisc -y

RUN cd / && git clone https://github.com/anabolyc/xupnpd.git
RUN cd /xupnpd/src && make

# cleanup 
RUN apt-get remove git build-essential uuid-dev psmisc -y && apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*
ENV M3U_URL http://example.com/list.m3u

COPY ./start.sh /usr/sbin/start.sh

EXPOSE 4044
CMD start.sh
