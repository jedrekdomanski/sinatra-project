# frozen_string_literal: true

require File.join(File.dirname(__FILE__), 'config/environment')

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run rake db:migrate to run pending migraitons.'
end

run ApplicationController
use ArticlesController
use AuthorsController
