# Base OS.
FROM centos:latest

# Maintainer.
MAINTAINER Mark Larter <mark@freeheelgroup.com>

# Update package manager.
RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all

# Install MongoDB.
RUN yum -y install mongodb-server; yum clean all
RUN mkdir -p /data/db

# Map ports.
EXPOSE 27017

# Set entry point.
ENTRYPOINT ["/usr/bin/mongod"]
