# Base OS minimal.
FROM alpine

# Maintainer.
MAINTAINER Mark Larter <mark@freeheelgroup.com>

# Create user and directory for data volume.
RUN adduser -D mongod && \
    mkdir /data && \
    touch /data/.keep && \
    chown -R mongod:mongod /data

# Default run command.
USER mongod
CMD ls -lha /data
