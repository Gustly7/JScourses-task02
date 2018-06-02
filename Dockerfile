#
# Ubuntu Node.js Dockerfile
#
# https://github.com/dockerfile/ubuntu/blob/master/Dockerfile
# https://docs.docker.com/examples/nodejs_web_app/
#

# Pull base image.
FROM ubuntu:14.04

# Install Node.js
RUN apt-get update
RUN apt-get install --yes curl
RUN apt-get install --yes git
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN apt-get install --yes nodejs
RUN apt-get install --yes build-essential

# Bundle app source
# Trouble with COPY http://stackoverflow.com/a/30405787/2926832
COPY src /code/src
COPY package.json /code
COPY webpack.config.js /code
COPY server.js /code

# Install app dependencies
RUN cd code;npm install

# Binds to port 8080
EXPOSE  8080

#  Defines your runtime(define default command)
# These commands unlike RUN (they are carried out in the construction of the container) are run when the container
#CMD ["node", "/src/index.js"]
RUN cd code;npm run build
#RUN cd code;nodejs server.js