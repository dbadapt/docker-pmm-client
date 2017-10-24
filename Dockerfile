FROM debian:8
MAINTAINER David Bennett <david.bennett@percona.com>

WORKDIR /root

RUN apt-get update \
  && apt-get install -y wget lsb \
  && wget https://repo.percona.com/apt/percona-release_0.1-4.$(lsb_release -sc)_all.deb \
  && dpkg -i percona-release_0.1-4.$(lsb_release -sc)_all.deb \
  && rm -f percona-release_0.1-4.$(lsb_release -sc)_all.deb \
  && apt-get update \
  && apt-get install -y pmm-client

COPY "intro_message.sh" /root

ENTRYPOINT ["./intro_message.sh"]
