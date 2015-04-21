# Base OS.
FROM centos:centos7

# Maintainer.
MAINTAINER Mark Larter <mark@freeheelgroup.com>

# Update package manager.
RUN yum update -y; yum clean all

# Set repository for mongo.
COPY ./mongodb-org-3.0.repo /etc/yum.repos.d/mongodb-org-3.0.repo

# Install mongo latest (v3+). Does NOT pin mongo version.
RUN yum install -y mongodb-org; yum clean all
# Install mongo specific version (3.0.2).
#RUN yum install -y mongodb-org-3.0.2 mongodb-org-server-3.0.2 mongodb-org-shell-3.0.2 mongodb-org-mongos-3.0.2 mongodb-org-tools-3.0.2; yum clean all

# Create directory for internal data volume. May be overriden by docker switches
# volume-from or volume.
RUN mkdir -p /data/db && \
    touch /data/db/.keep && \
    chown -R mongod:mongod /data/db

# Add mongo conf.
#ADD mongodb.conf /etc/mongodb.conf

# Map ports.
EXPOSE 27017

# Set mongo process user.
USER mongod

# Define default data volume.
VOLUME ["/data/db"]
WORKDIR /data/db

# Set entrypoint.
ENTRYPOINT ["/usr/bin/mongod"]

# Provide default run command and/or parameters.
# TODO: Modify as needed to run mongo with fleet.
#CMD ["--storageEngine wiredTiger"]
