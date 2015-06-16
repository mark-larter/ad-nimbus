# Minimal base layer for data container.
FROM scratch

# Maintainer.
MAINTAINER Mark Larter <mark@freeheelgroup.com>

# Create user and directory for data volume.
RUN adduser -D data && \
    mkdir /data && \
    touch /data/.keep && \
    chown -R data:data /data

# Default CMD
CMD ["/bin/bash"]
#CMD ["ls -lah /data"]
