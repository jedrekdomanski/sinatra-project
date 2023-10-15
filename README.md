# README
![example branch parameter](https://github.com/github/docs/actions/workflows/main.yml/badge.svg?branch=master)
## Setting Up Your Environment
### Installing dependencies
* Run Bundler `bundle install`
* Create the database `bundle exec rake db:create`
* Run migrations `bundle exec rake db:migrate`

### Populating the database
`bundle exec rake db:seed`

## How to Run Tests
Run: `bundle exec rspec`

## Database Operations
Add migration
```
bundle exec rake db:create_migration NAME=create_users
```
Run migration
```
bundle exec rake db:migrate
```

## Dockerizing the app
Build a new docker image
```
docker buildx build --load -t domanskij/sinatra-api:#{VERSION} --builder=mybuilder .
```
Tag the image
```
docker tag domanskij/sinatra-api:#{VERSION} domanskij/sinatra-api:latest
```
Push the image
```
docker push domanskij/sinatra-api:latest
```
