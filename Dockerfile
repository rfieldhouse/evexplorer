FROM ubuntu:14.04.2
MAINTAINER rfieldhouse

# Update Ubuntu and add extra repositories
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y install software-properties-common
RUN apt-get update && apt-get -y upgrade

# Install basics
RUN apt-get -y install x11-apps
#RUN apt-get -y install --no-install-recommends lubuntu-desktop
#RUN apt-get -y install gnome-app-install
#RUN apt-get -y install gnome-core
#RUN apt-get -y install gnome-system-tools
RUN apt-get -y install xorg
RUN apt-get -y install xvfb
RUN apt-get -y install wget
RUN apt-get -y install sshfs
RUN apt-get -y install links
RUN apt-get -y install git
RUN apt-get -y install nano

# Install python
RUN wget http://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh -O miniconda.sh
RUN chmod +x miniconda.sh
RUN ./miniconda.sh -b
ENV PATH /root/miniconda/bin:$PATH
RUN conda update conda --yes
RUN conda install --yes numpy pandas matplotlib bokeh seaborn statsmodels
RUN pip install logging prettyplotlib dataspyre cherrypy

#RUN git clone https://github.com/adamhajari/spyre.git

COPY simple_sine_example.py /simple_sine_example.py
CMD ["python", "simple_sine_example.py"]