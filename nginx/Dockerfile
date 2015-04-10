# Base OS.
FROM centos:centos7

# Maintainer.
MAINTAINER Mark Larter <mark@freeheelgroup.com>

# Update package manager.
RUN yum update -y

# Set repository for nginx.
COPY ./nginx.repo /etc/yum.repos.d/nginx.repo

# Install wget, nginx.
RUN yum install -y wget
RUN yum install -y nginx
RUN yum clean all

# Install confd v0.8.0.
RUN wget -O confd https://github.com/kelseyhightower/confd/releases/download/v0.8.0/confd-0.8.0-linux-amd64
RUN mv confd /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd

# Create directories.
RUN mkdir -p /etc/confd/{conf.d,templates}
RUN mkdir -p /etc/nginx/{sites-available,sites-enabled}

# Add confd files.
ADD ./nginx.conf.toml /etc/confd/conf.d/nginx.conf.toml
ADD ./nginx.conf.tmpl /etc/confd/templates/nginx.conf.tmpl

# Remove default site.
RUN rm -f /etc/nginx/sites-enabled/default

# Copy app source to VM.
#COPY . /usr/share/nginx/html
#RUN rm -v /etc/nginx/nginx.conf
#COPY content /usr/share/nginx/html
#COPY conf /etc/nginx

# Make these folders accessible by ssh container.
#VOLUME /usr/share/nginx/html
#VOLUME /etc/nginx

# Map ports.
EXPOSE 80
EXPOSE 443

# Add boot script.
ADD ./boot.sh /opt/boot.sh
RUN chmod +x /opt/boot.sh

# Run the boot script.
CMD /opt/boot.sh

# Don't start nginx, boot script will do this after confd has created nginx.conf.
#CMD ["nginx", "-g", "daemon off;"]
