#!/bin/bash

# build the flask container
docker build -t clarketm/cheermeapp .

# create the network
docker network create cheermeapp

# start the ES container
docker run -d --net cheermeapp -p 9200:9200 -p 9300:9300 --name es elasticsearch

# start the flask app container
docker run -d --net cheermeapp -p 5000:5000 -p 8080:8080 --name cheermeapp clarketm/cheermeapp