FROM node:26.13.1
MAINTAINER mike hajj <mike.hajj@gmail.com>

RUN apt-get update
RUN echo "Installing buld essentials ... "
RUN apt-get install -y build-essential python3 g++ make

# EC-3742 / NGINX2Root: rebuild so apt installs Debian security nginx
RUN echo "Installing Nginx... "
RUN apt-get install -y nginx \
 && nginx -v \
 && dpkg-query -W -f='nginx ${Version}\n' nginx

RUN echo "Configuring Nginx... "
COPY nginx.conf /etc/nginx/nginx.conf