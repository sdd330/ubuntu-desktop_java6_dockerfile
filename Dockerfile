FROM dockerfile/ubuntu-desktop
MAINTAINER yang.leijun@gmail.com

# Ports
EXPOSE 22

# Settings
# None

RUN apt-get update

# Install Java.
RUN \
  echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java6-installer

# Install SSH
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Removed unnecessary packages
RUN apt-get autoremove -y

# Clear package repository cache
RUN apt-get clean all

# Define default command.
CMD ["bash"]

