FROM java:8

ENV UNIFI_VERSION=unifi3 \
    DEBIAN_FRONTEND=noninteractive \
    LC_ALL=C.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

WORKDIR /tmp

RUN echo deb http://www.ubnt.com/downloads/unifi/debian $UNIFI_VERSION ubiquiti \
      >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv 06E85760C0A52C50 && \
    apt-get update -q && \
    apt-get install -y unifi && \
    wget https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64.deb && \
    dpkg -i dumb-init_1.2.0_amd64.deb && \
    rm -rf /var/lib/unifi/* /var/lib/apt/lists/* /var/tmp/* /tmp/*

EXPOSE 8080 8443 8843 8880
EXPOSE 3478/udp

VOLUME /var/lib/unifi

COPY entrypoint.sh /
CMD ["-Xmx1024M"]
ENTRYPOINT ["/entrypoint.sh"]
