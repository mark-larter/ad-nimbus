# Minimal base layer for statically linked Go app.
FROM scratch

# Maintainer.
MAINTAINER Mark Larter <mark@freeheelgroup.com>

# Pull in the app.
ADD /netLocation /app/netLocation

# Pull in app data.
ADD /data /data

# Expose port. TODO: figure out how to link this with the http server in the app.
EXPOSE 8080

# Run the app.
CMD ["/app/netLocation"]
