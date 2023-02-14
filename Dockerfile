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

ARG IMAGE_TAG
ENV IMAGE_TAG=$IMAGE_TAG

RUN mkdir -p /app/vendor/gems
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN gem install bundler:2.2.24

RUN bundle install \
  --without development test \
  --deployment

COPY . /app

COPY config/database.ci.yml config/database.yml

EXPOSE 4567
ENTRYPOINT ["bundle", "exec"]
CMD ./entrypoint.sh

# Deploy Image
FROM base as deploy
RUN rm -rf /root/.ssh

# Dev Image
FROM base as dev

RUN bundle install --with development

RUN apk update && apk upgrade && apk --no-cache add \
  curl-dev \
  postgresql \
  && echo ‘gem: --no-document’ > /etc/gemrc

RUN rm -rf /root/.ssh

# CI Image
FROM base as ci
RUN apk update && apk upgrade && apk --no-cache add \
  curl-dev \
  postgresql \
  && echo ‘gem: --no-document’ > /etc/gemrc

RUN bundle install \
  --with test \
  --deployment

RUN rm -rf /root/.ssh
