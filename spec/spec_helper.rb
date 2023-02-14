# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'

require File.expand_path('../../config/environment.rb', __FILE__)
require 'database_cleaner'
require 'faker'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.disable_monkey_patching!
  config.warnings = true
  config.default_formatter = 'doc' if config.files_to_run.one?
  config.profile_examples = 10
  config.order = :random

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # Tests with `type: :query` allow you to load your
  # DB setup once and run many examples on that state
  # This is usefull for testing read-only services (aka queries)
  config.before(:all, type: :query) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.after(:all, type: :query) do
    DatabaseCleaner.clean
  end

  Kernel.srand config.seed
end
