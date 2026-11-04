FROM node:26.13.0
MAINTAINER mike hajj <mike.hajj@gmail.com>

RUN apt-get update
RUN echo "Installing buld essentials ... "
RUN apt-get install -y build-essential python3 g++ make

RUN echo "Installing Nginx... "
RUN apt-get install -y nginx

RUN echo "Configuring Nginx... "
COPY nginx.conf /etc/nginx/nginx.conf