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
# RUN make index
# RUN make frontend (cd frontend && python -m http.server)
# RUN make backend


# expose port
EXPOSE 80
EXPOSE 5000

# start app

###### frontend
# http-server frontend/ -p 80

###### backend
# python runbackend.py

# CMD [ "python", "./app.py" ]

###### UTILS
# docker run -dp 9200:9200 --net cheermeapp --name es elasticsearch
# docker run -it --rm --net cheermeapp clarketm/cheermeapp bash