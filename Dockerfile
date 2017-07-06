# Set the base image to use to armhf
FROM armbuild/debian:jessie

# reqired packages
RUN apt-get update && apt-get install git build-essential uuid-dev psmisc -y

RUN cd / && git clone https://github.com/anabolyc/xupnpd.git
RUN cd /xupnpd/src && make
RUN mkdir /xupnpd/src/playlists -p

# cleanup 
RUN apt-get remove git build-essential uuid-dev psmisc -y && apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*

# ENV M3U_URL http://example.com/list.m3u
ENV FRONTEND_NAME IPTV
ENV FRONTEND_PORT 4044
ENV BACKEND_HOST localhost
ENV BACKEND_PORT 8000
ENV BACKEND_GUID 60bd2fb3-dabe-cb14-c766-0e319b54c29a

COPY ./start.sh /usr/sbin/start.sh

EXPOSE 4040-4050
CMD start.sh
