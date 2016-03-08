FROM ubuntu:15.10
MAINTAINER Aad Versteden <madnificent@gmail.com>

# RUN apt-get -y update; apt-get -y install nodejs npm;
# RUN apt-get -y 
# RUN npm install -g ember-cli@2.3.0-beta.2

# Install nodejs as per http://askubuntu.com/questions/672994/how-to-install-nodejs-4-on-ubuntu-15-04-64-bit-edition
RUN apt-get -y update; apt-get -y install wget python build-essential git
RUN wget -qO- https://deb.nodesource.com/setup_4.x > node_setup.sh
RUN bash node_setup.sh
RUN apt-get -y install nodejs
RUN npm install -g bower
RUN npm install -g ember-cli@2.4.2

WORKDIR /app
