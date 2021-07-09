FROM ubuntu:20.04

ARG UID=${UID}

ARG GID=${GID}

RUN apt update

RUN apt install curl git -y

RUN curl -o nodejs.deb https://deb.nodesource.com/node_16.x/pool/main/n/nodejs/nodejs_16.0.0-deb-1nodesource1_amd64.deb

RUN apt install -y ./nodejs.deb

RUN rm nodejs.deb

RUN rm -rf /var/lib/apt/lists/

RUN groupadd -g ${GID} docker && useradd -u ${UID} docker -g docker

USER ${UID}

WORKDIR /node/app/
