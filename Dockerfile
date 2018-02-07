FROM ruby:2.3.4-alpine

ENV LANG ja_JP.UTF-8

RUN apk update && \
    apk upgrade && \
    apk add --update\
    bash \
    build-base \
    curl-dev \
    git \
    libxml2-dev \
    libxslt-dev \
    linux-headers \
    mariadb-dev \
    nodejs \
    openssh \
    ruby-dev \
    ruby-json \
    tzdata \
    yaml \
    yaml-dev \
    zlib-dev

##### Rails #####
RUN gem install bundler

RUN mkdir /site
WORKDIR /site
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

ADD . /site

EXPOSE 3000
CMD ['rails', 'server', '-b', '0.0.0.0']
