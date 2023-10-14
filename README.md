# README #
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
