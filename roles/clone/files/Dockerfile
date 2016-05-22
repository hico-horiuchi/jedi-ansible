FROM ubuntu:14.04

RUN \
  sed -i -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get -y install software-properties-common && \
  rm -rf /var/lib/apt/lists/*

RUN \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get -y install nginx && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx && \
  rm /etc/nginx/sites-enabled/default

CMD ["nginx"]

EXPOSE 80

VOLUME ["/etc/nginx/sites-enabled", "/var/www/html"]

WORKDIR /etc/nginx
