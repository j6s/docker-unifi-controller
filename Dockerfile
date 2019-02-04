FROM ubuntu

RUN apt-get update &&  apt-get -y install apt-transport-https gnupg

RUN echo 'deb http://www.ui.com/downloads/unifi/debian stable ubiquiti' > /etc/apt/sources.list.d/100-ubnt-unifi.list
RUN echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 06E85760C0A52C50 
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6

RUN apt-get update && apt-get install -y unifi

VOLUME ["/usr/lib/unifi/data"]

WORKDIR /usr/lib/unifi
ENTRYPOINT java -jar lib/ace.jar start
