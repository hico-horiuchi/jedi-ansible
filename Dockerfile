FROM jenkins:2.32.1

USER root

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get -y install gcc make ruby ruby-dev software-properties-common && \
  rm -rf /var/lib/apt/lists/* && \
  gem install bundler --no-ri --no-rdoc

RUN \
  add-apt-repository -y ppa:ansible/ansible && \
  echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' > /etc/apt/sources.list.d/ansible-ansible-jessie.list && \
  apt-get update && \
  apt-get -y install ansible && \
  rm -rf /var/lib/apt/lists/*

USER jenkins
