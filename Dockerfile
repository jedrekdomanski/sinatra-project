FROM --platform=linux/amd64 ruby:3.2.4-alpine AS base
RUN apk add --update \
    tzdata \
    bash \
    openssh \
    file \
    libxml2-dev \
    curl \
    gcompat \
    shared-mime-info \
    postgresql-dev \
    postgresql-client \
    libpq

# This stage will be responsible for installing gems and npm packages
FROM base AS dependencies

# Install system dependencies required to build some Ruby gems (pg)
RUN apk add --update build-base

FROM dependencies AS ci
WORKDIR /app
COPY . .

RUN bundle config set without "development" && bundle config set with "test" \
  && bundle install --jobs="$(getconf _NPROCESSORS_ONLN)" --retry=3
COPY config/database.ci.yml config/database.yml

FROM dependencies AS deploy-dependencies
COPY Gemfile Gemfile.lock ./
# Don't install development or test dependencies
RUN bundle config set without "development test" \
  && bundle install --jobs="$(getconf _NPROCESSORS_ONLN)" --retry=3

# We're back at the base stage
# Deploy Image
FROM base AS deploy

# Create a non-root user to run the app and own app-specific files
RUN adduser -D app

# Switch to this user
USER app

WORKDIR /app

# Copy over gems from the dependencies stage
COPY --from=deploy-dependencies /usr/local/bundle/ /usr/local/bundle/

# Finally, copy over the code
# This is where the .dockerignore file comes into play
# Note that we have to use `--chown` here
COPY --chown=app . ./

ENTRYPOINT ["bundle", "exec"]
CMD ["rackup", "--host", "0.0.0.0", "-p", "4567", "config.ru"]

