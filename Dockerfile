FROM ubuntu:14.04
MAINTAINER rjf

##### UBUNTU
# Update Ubuntu and add extra repositories
RUN apt-get -y install software-properties-common
RUN apt-add-repository -y ppa:marutter/rrutter
RUN apt-get -y update && apt-get -y upgrade

# Install basic commands 
RUN apt-get -y install links nano


EXPOSE 8080
