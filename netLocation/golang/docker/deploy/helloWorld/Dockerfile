# Minimal base layer for statically linked Go app.
FROM scratch

# Maintainer.
MAINTAINER Mark Larter <mark@freeheelgroup.com>

# Pull in the app.
ADD /helloWorld /app/helloWorld

# Expose port. TODO: figure out how to link this with the http server in the app.
EXPOSE 8080

# Run the app.
CMD ["/app/helloWorld"]
