FROM ubuntu

COPY . .

RUN apt-get update

RUN apt-get install -y build-essential

RUN apt-get install -y python2.7 python2.7-dev

RUN apt-get install -y curl

RUN apt-get install -y wget

RUN apt-get install -y git

RUN apt-get install -y mongodb-org-shell=3.2

RUN apt-get install -y mongodb-org-tools=3.2

RUN wget https://bootstrap.pypa.io/get-pip.py

RUN python2.7 get-pip.py

EXPOSE 10817

RUN curl --silent --location https://deb.nodesource.com/setup_4.x | sudo bash -

RUN apt-get install -y nodejs

RUN npm install -g bower

RUN npm install

RUN bower install -s --allow-root

VOLUME /var/log/busstops

ADD routes.json /tmp/routes.json

ADD startup.sh /tmp/startup.sh

RUN chmod +x /tmp/startup.sh

RUN /tmp/startup.sh

CMD nodejs app.js
