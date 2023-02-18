FROM ruby:2.7.4-alpine as base

RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk update && apk upgrade && apk --no-cache add \
  build-base \
  libpq \
  libstdc++ \
  ca-certificates \
  libffi-dev \
  postgresql-dev \
  postgresql-client \
  linux-headers \
  ruby-dev \
  openssh \
  shared-mime-info \
  libucontext-dev \
  file \
  libxml2-dev \
  && echo ‘gem: --no-document’ > /etc/gemrc

RUN mkdir /app
RUN mkdir -p /app/vendor/gems
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN gem install bundler:2.2.33

RUN bundle install \
  --without development test

COPY . /app

COPY config/database.ci.yml config/database.yml

EXPOSE 4567

ENTRYPOINT "./entrypoint.sh"
