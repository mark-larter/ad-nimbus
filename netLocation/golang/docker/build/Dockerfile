# Base OS. Ready and set to Go.
FROM golang:1.4.2

# Maintainer.
MAINTAINER Mark Larter <mark@freeheelgroup.com>

# Enable static compilation.
# RUN CGO_ENABLED=0 go get -a -ldflags '-s' github.com/adriaandejonge/helloworld
RUN CGO_ENABLED=0 go build -a -tags netgo -ldflags '-w' . docker build -t marklarter/netlocation-golang .

# Default CMD
CMD ["/bin/bash"]