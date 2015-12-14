FROM ubuntu

COPY . .

RUN apt-get update

RUN apt-get install -y build-essential

RUN apt-get install -y python2.7 python2.7-dev

RUN apt-get install -y curl

RUN apt-get install -y wget

RUN apt-get install -y git

RUN wget https://bootstrap.pypa.io/get-pip.py

RUN python2.7 get-pip.py

EXPOSE 10817

RUN curl --silent --location https://deb.nodesource.com/setup_4.x | sudo bash -

RUN apt-get install -y nodejs

RUN npm install -g bower

RUN npm install

RUN bower install -s --allow-root

VOLUME /var/log/busstops

CMD nodejs app.js
