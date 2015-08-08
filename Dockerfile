FROM debian:jessie
MAINTAINER Jaime Leonardo Suncin Cruz <leosuncin@gmail.com>

RUN apt-get update
RUN apt-get install -y -q --force-yes curl ca-certificates apt-utils git apt-transport-https lsb-release
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv C3173AA6 && \
	printf "deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu trusty main\n\
	deb-src http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu trusty main\n" \
	| tee /etc/apt/sources.list.d/brightbox-ruby-ng.list
RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install -y -q --force-yes nodejs build-essential ruby2.2 ruby2.2-dev ruby-switch
RUN gem install compass
RUN npm install -g --unsafe-perm sails grunt-cli bower coffee-script mocha
RUN gem clean cache && npm cache clean && apt-get autoremove -y
RUN apt-get clean && rm -rf /var/lib/apt/list/*

VOLUME /srv/sails
EXPOSE 1337
ENTRYPOINT [ "/usr/bin/sails" ]
CMD [ "lift" ]