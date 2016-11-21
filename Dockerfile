# start from base
FROM ubuntu:14.04
MAINTAINER Travis Clarke <travis.m.clarke@gmail.com>

# install system-wide deps for python and node
RUN apt-get -yqq update
RUN apt-get -yqq install python-pip python-dev curl
RUN apt-get -yqq install nodejs npm
RUN ln -s /usr/bin/nodejs /usr/bin/node

# copy our application code
ADD . /opt/app
WORKDIR /opt/app

# fetch app specific deps
RUN npm install
RUN npm run build
RUN pip install -r requirements.txt

# expose port
EXPOSE 8080
EXPOSE 5000

# start app
CMD (http-server frontend -s -p 8080 && python -s runbackend.py) &

###### UTILS

# Run Elasticsearch
# docker run -dp 9200:9200 --net cheermeapp --name es elasticsearch

# Run CheerMeApp
# dev
# docker run -it --rm --net cheermeapp clarketm/cheermeapp bash
# prod
# docker run -d --net cheermeapp -p 5000:5000 -p 8080:8080 --name cheermeapp-web clarketm/cheermeapp