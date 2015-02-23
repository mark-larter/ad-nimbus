# Instructions from https://registry.hub.docker.com/_/nginx/
# From: http://nginx.com/blog/deploying-nginx-nginx-plus-docker/

FROM nginx:latest

MAINTAINER Andy Steere <andy.steere@troppussoftware.com>

COPY . /usr/share/nginx/html

RUN rm -v /etc/nginx/nginx.conf

COPY content /usr/share/nginx/html
COPY conf /etc/nginx

# Make these folder accessible by ssh container
VOLUME /usr/share/nginx/html
VOLUME /etc/nginx

EXPOSE 80
EXPOSE 443

#CMD ["nginx", "-g", "daemon off;"]

