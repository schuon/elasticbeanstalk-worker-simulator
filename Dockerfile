FROM frolvlad/alpine-oraclejdk8:slim

MAINTAINER Sebastian Schuon <sebastian.schuon@gmail.com>

RUN apk add --update bash

RUN mkdir -p /root/eb-worker-sim
COPY gradle/wrapper/ /root/eb-worker-sim/gradle/wrapper/
COPY src /root/eb-worker-sim/src/
COPY gradlew /root/eb-worker-sim/
COPY settings.gradle /root/eb-worker-sim/
COPY build.gradle /root/eb-worker-sim/
COPY gradle.properties /root/eb-worker-sim/
COPY application.properties.template /root/eb-worker-sim/

COPY run_docker.sh /root/eb-worker-sim/
ADD https://raw.githubusercontent.com/johanhaleby/bash-templater/master/templater.sh /root/eb-worker-sim/templater.sh
RUN chmod +x /root/eb-worker-sim/templater.sh
WORKDIR /root/eb-worker-sim


ENTRYPOINT ["./run_docker.sh"]
