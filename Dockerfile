FROM ubuntu

MAINTAINER Abraão Silva

USER root

# Install tools binaries
RUN apt-get update && apt-get -y install \
      apt-transport-https \
      ca-certificates \
      curl \
      wget \
      telnet \
      gnupg2 \
      software-properties-common \
      rsync \
      zip \
      sudo
      
# install awscli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip
RUN ./aws/install -i /usr/local/aws-cli -b /usr/local/bin

ADD start.sh /start.sh

ENTRYPOINT ["/start.sh"]
