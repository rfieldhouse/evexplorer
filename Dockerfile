FROM ubuntu:14.04
MAINTAINER rfieldhouse

##### UBUNTU
# Update Ubuntu and add extra repositories
RUN apt-get -y install software-properties-common
RUN apt-get update && apt-get -y upgrade

# Install basic commands 
RUN apt-get -y install links

# Install python
RUN wget http://09c8d0b2229f813c1b93-c95ac804525aac4b6dba79b00b39d1d3.r79.cf1.rackcdn.com/Anaconda-2.0.1-Linux-x86_64.sh
RUN bash Anaconda-2.0.1-Linux-x86.sh -b
RUN conda update conda --yes
RUN conda update anaconda --yes
RUN pip install prettyplotlib seaborn mpld3

EXPOSE 8080