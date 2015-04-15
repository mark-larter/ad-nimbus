# Base OS.
FROM centos:centos7

# Maintainer.
MAINTAINER Mark Larter <mark@freeheelgroup.com>

# Update package manager.
RUN yum update -y; yum clean all

# Install SELinux utilities.
RUN yum install -y policycoreutils policycoreutils-python selinux-policy; yum clean all

# Set repository for mongo.
COPY ./mongodb-org-3.0.repo /etc/yum.repos.d/mongodb-org-3.0.repo

# Install mongo latest (v3+). Does NOT pin mongo version.
RUN yum install -y mongodb-org; yum clean all
# TODO: Pin mongo version.
#RUN yum install -y mongodb-org-3.0.2 mongodb-org-server-3.0.2 mongodb-org-shell-3.0.2 mongodb-org-mongos-3.0.2 mongodb-org-tools-3.0.2; yum clean all

# Create data folder.
RUN mkdir -p /data/db
VOLUME ["/data/db"]
#WORKDIR /data

# Map ports.
EXPOSE 27017

# Configure SELinux to allow mongo to start.
#USER root
#RUN semanage port -a -t mongod_port_t -p tcp 27017
#USER mongodb

# Set entrypoint.
ENTRYPOINT ["/usr/bin/mongod"]

# Provide default run command and/or parameters.
# TODO: Modify as needed to run mongo with fleet.
#CMD ["--storageEngine wiredTiger"]
