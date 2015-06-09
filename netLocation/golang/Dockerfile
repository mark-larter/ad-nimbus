# Base OS minimal.
FROM gliderlabs/alpine:3.1

# Maintainer.
MAINTAINER Mark Larter <mark@freeheelgroup.com>

# Install golang.
RUN apk update && apk-install go

# Set environment.
ENV GOROOT /usr/lib/go
ENV GOPATH /gopath
ENV GOBIN /gopath/bin
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin


# Default run command.
