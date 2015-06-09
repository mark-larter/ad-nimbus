# Base OS.
FROM centos:centos7

# Maintainer.
MAINTAINER Mark Larter <mark@freeheelgroup.com>

# Set repository for nodejs.
RUN curl -sL https://rpm.nodesource.com/setup | bash -

# Install nodejs and npm.
RUN yum install -y nodejs; yum clean all

# Install app dependencies, first of all ensure newest npm.
RUN npm install npm -g
RUN npm i express
RUN npm i maxmind-db-reader

# TODO: Do we want to use forever to make sure nodejs restarts
# From: https://www.digitalocean.com/community/tutorials/how-to-host-multiple-node-js-applications-on-a-single-vps-with-nginx-forever-and-crontab

# Copy app source to VM.
COPY ./src /src

# Install app.
RUN cd /src; npm i

# Map port.
EXPOSE 8080

# Set entrypoint.
ENTRYPOINT ["usr/bin/node"]

# Provide default run command and/or parameters.
CMD ["/src/index.js"]

