<<<<<<< HEAD
# Base OS.
FROM centos:latest

# Maintainer.
MAINTAINER Mark Larter <mark@freeheelgroup.com>

# Update package manager.
RUN yum update -y

# Set repository for nginx.
COPY ./nginx.repo /etc/yum.repos.d/nginx.repo

# Install nginx.
RUN yum install -y nginx

# Copy app source to VM.
#COPY . /usr/share/nginx/html
#RUN rm -v /etc/nginx/nginx.conf
#COPY content /usr/share/nginx/html
#COPY conf /etc/nginx

# Make these folder accessible by ssh container
#VOLUME /usr/share/nginx/html
#VOLUME /etc/nginx

# Map ports.
EXPOSE 80
EXPOSE 443

# Run app.
CMD ["nginx"]
=======
# Instructions from https://registry.hub.docker.com/_/nginx/
# From: http://nginx.com/blog/deploying-nginx-nginx-plus-docker/

FROM nginx:latest

MAINTAINER Andy Steere <andy.steere@troppussoftware.com>

COPY . /usr/share/nginx/html

RUN rm -v /etc/nginx/conf.d/default.conf
RUN rm -v /etc/nginx/nginx.conf

COPY content /usr/share/nginx/html
ADD nginx.conf /etc/nginx/

# Make these folder accessible by ssh container
VOLUME /usr/share/nginx/html
VOLUME /etc/nginx

EXPOSE 80
EXPOSE 443

# Don't start nginx, let fleetctl do it on coreos startup
#CMD ["nginx", "-g", "daemon off;"]
>>>>>>> master

