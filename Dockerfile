################# Usage #################

# [BUILD]
# sudo docker build . -t geoserver:2.18.2

# [TEST]
# curl localhost:8080

################# Usage #################

FROM ubuntu:20.04

RUN apt-get update

RUN apt-get install unzip

RUN apt install openjdk-8-jdk -y

RUN export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
RUN export PATH=$PATH:$JAVA_HOME/bin

RUN java -version

COPY ./geoserver-2.18.2-bin.zip /tmp/
RUN unzip /tmp/geoserver-2.18.2-bin.zip -d /tmp/geoserver
WORKDIR /tmp/geoserver/bin
RUN ./startup.sh
