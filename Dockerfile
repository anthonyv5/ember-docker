# Dockerfile for Ember CLI, PhantomJS, and Bower

FROM sebp/nodejs
MAINTAINER Sebastien Pujadas http://pujadas.net
ENV REFRESHED_AT 2015-05-15

WORKDIR /tmp


### install Ember CLI, PhantomJS, and Bower

RUN npm install -g ember-cli \
 && apt-get update -qq \
 && apt-get install -qqy libfontconfig libfontconfig-dev libfreetype6-dev \
 && npm install -g phantomjs \
 && npm install -g bower


### set up

# For some strange reason Bower doesn't like running
# without a /var/www directory! Even if we're running
# it from a completely different directory! Strange!? 
RUN mkdir -p /data/www /var/www \
 && chown www-data:www-data /var/www /data/www

VOLUME ["/data"]
WORKDIR /data/www

USER www-data
ENV HOME /data/www

ENTRYPOINT ["ember"]
CMD ["help"]
