FROM armv7/armhf-ubuntu:16.04

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

COPY erlang /etc/apt/preferences.d/

# Instructions from here - https://www.rabbitmq.com/install-debian.html
RUN echo "deb https://dl.bintray.com/rabbitmq/debian {xenial} main" | tee /etc/apt/sources.list.d/bintray.rabbitmq.list
RUN wget -O- https://dl.bintray.com/rabbitmq/Keys/rabbitmq-release-signing-key.asc | apt-key add -
RUN wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | apt-key add -
RUN apt-get update
RUN apt-get install rabbitmq-server

RUN rabbitmq-plugins enable rabbitmq_management

RUN service rabbitmq-server start
