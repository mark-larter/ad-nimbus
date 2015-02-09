# Base OS.
FROM centos:latest

# Maintainer.
MAINTAINER Mark Larter <mark@freeheelgroup.com>

# Set repository for nodejs.
RUN curl -sL https://rpm.nodesource.com/setup | bash -

# Install nodejs and npm.
RUN yum install -y nodejs

# Bundle source.
COPY . /src

# Install dependencies.
RUN npm i maxmind-db-reader

# Install app.
RUN cd /src; npm i

# Map port.
EXPOSE 8080

# Define runtime.
CMD ["node", "/src/index.js"]

