# Base OS. Ready and set to Go.
FROM golang:1.4.2

# Maintainer.
MAINTAINER Mark Larter <mark@freeheelgroup.com>

# Enable static compilation.
ENV CGO_ENABLED=0 GOOS=linux
# RUN CGO_ENABLED=0 go get -a -ldflags '-s' github.com/adriaandejonge/helloworld
#RUN CGO_ENABLED=0 GOOS=linux go build -a -tags netgo -ldflags '-w' . docker build -t marklarter/netlocation-go .

# Default command.
CMD ["/bin/bash"]
